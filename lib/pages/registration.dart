import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'harvest_detail.dart'; 

class RegistrosPage extends StatefulWidget {
  const RegistrosPage({super.key, required this.title});

  final String title;

  @override
  State<RegistrosPage> createState() => RegistrosPageState();
}

class RegistrosPageState extends State<RegistrosPage> {
  bool _showCosechas = true;
  List<Map<String, dynamic>> _cosechas = [];

  @override
  void initState() {
    super.initState();
    _loadCosechas();
  }

  Future<void> _loadCosechas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cosechasJson = prefs.getString('cosechas');
    if (cosechasJson != null) {
      List<dynamic> decoded = jsonDecode(cosechasJson);
      setState(() {
        _cosechas = List<Map<String, dynamic>>.from(decoded);
      });
    }
  }

  Widget _buildCosechasList() {
    if (_cosechas.isEmpty) {
      return const Center(child: Text('No hay registros de cosechas'));
    }
    return ListView.builder(
      itemCount: _cosechas.length,
      itemBuilder: (context, index) {
        final cosecha = _cosechas[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            title: Text(cosecha['fruta'] ?? 'Fruta desconocida'),
            subtitle: Text('Variedad: ${cosecha['variedad'] ?? '-'}\n'
                'Fecha: ${cosecha['fecha'] ?? '-'}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HarvestDetailPage(cosecha: cosecha),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildMantenciones() {
    return const Center(
      child: Text(
        'Sección de mantenciones\nPróximamente...',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _showCosechas
                          ? colorScheme.primary
                          : colorScheme.surfaceVariant,
                      foregroundColor: _showCosechas
                          ? colorScheme.onPrimary
                          : colorScheme.onSurfaceVariant,
                    ),
                    onPressed: () {
                      setState(() {
                        _showCosechas = true;
                      });
                    },
                    child: const Text('Cosechas'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !_showCosechas
                          ? colorScheme.primary
                          : colorScheme.surfaceVariant,
                      foregroundColor: !_showCosechas
                          ? colorScheme.onPrimary
                          : colorScheme.onSurfaceVariant,
                    ),
                    onPressed: () {
                      setState(() {
                        _showCosechas = false;
                      });
                    },
                    child: const Text('Mantenciones'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _showCosechas ? _buildCosechasList() : _buildMantenciones(),
          ),
        ],
      ),
    );
  }
}
