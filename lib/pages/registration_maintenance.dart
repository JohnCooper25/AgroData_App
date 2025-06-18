import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'maintenance_detail.dart';

class RegistrosMantencionesPage extends StatefulWidget {
  final String marca; // 'Deutz Fahr' o 'Kubota'

  const RegistrosMantencionesPage({super.key, required this.marca});

  @override
  State<RegistrosMantencionesPage> createState() => _RegistrosMantencionesPageState();
}

class _RegistrosMantencionesPageState extends State<RegistrosMantencionesPage> {
  List<Map<String, dynamic>> _mantenciones = [];

  @override
  void initState() {
    super.initState();
    _loadMantenciones();
  }

  Future<void> _loadMantenciones() async {
  final prefs = await SharedPreferences.getInstance();
  final String? data = prefs.getString('mantenciones');
  if (data != null) {
    final List<dynamic> decoded = jsonDecode(data);
    final all = List<Map<String, dynamic>>.from(decoded);
    print('Todos los registros: $all'); // DEBUG
    setState(() {
      _mantenciones = all.where((m) => m['marca'] == widget.marca).toList();
      print('Registros filtrados para marca ${widget.marca}: $_mantenciones'); // DEBUG
    });
  }
}

  Future<void> _saveMantenciones(List<Map<String, dynamic>> newList) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('mantenciones', jsonEncode(newList));
  }

  void _updateMantencion(Map<String, dynamic> updated) {
    final index = _mantenciones.indexWhere((m) => m['uuid'] == updated['uuid']);
    if (index != -1) {
      setState(() {
        _mantenciones[index] = updated;
      });
      _saveMantenciones([..._mantenciones]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mantenciones ${widget.marca}'),
      ),
      body: _mantenciones.isEmpty
          ? const Center(
              child: Text(
                'No hay registros disponibles',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: _mantenciones.length,
              itemBuilder: (context, index) {
                final m = _mantenciones[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text('${m['modelo'] ?? 'Modelo desconocido'}'),
                    subtitle: Text('Código: ${m['codigo'] ?? '-'}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MaintenanceDetailPage(
                            mantencion: m,
                            onUpdate: _updateMantencion,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
