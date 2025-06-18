import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'harvest_detail.dart';

class RegistrosPage extends StatefulWidget {
  final String title;
  final String? frutaFiltrada;

  const RegistrosPage({super.key, required this.title, this.frutaFiltrada});

  @override
  State<RegistrosPage> createState() => RegistrosPageState();
}

class RegistrosPageState extends State<RegistrosPage> {
  List<Map<String, dynamic>> _cosechas = [];

  @override
  void initState() {
    super.initState();
    _loadCosechas();
  }

  @override
  void didUpdateWidget(covariant RegistrosPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.frutaFiltrada != oldWidget.frutaFiltrada) {
      _loadCosechas();
    }
  }

  Future<void> _loadCosechas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cosechasJson = prefs.getString('cosechas');
    if (cosechasJson != null) {
      List<dynamic> decoded = jsonDecode(cosechasJson);
      List<Map<String, dynamic>> allCosechas = List<Map<String, dynamic>>.from(decoded);
      setState(() {
        _cosechas = widget.frutaFiltrada != null
            ? allCosechas.where((c) {
                final frutaSinEditado = c['fruta']?.toString().replaceAll(' (editado)', '') ?? '';
                return frutaSinEditado == widget.frutaFiltrada;
              }).toList()
            : allCosechas;
      });
    } else {
      setState(() {
        _cosechas = [];
      });
    }
  }

  Future<void> _saveCosechas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encoded = jsonEncode(_cosechas);
    await prefs.setString('cosechas', encoded);
  }

  void _updateCosecha(Map<String, dynamic> editedCosecha) {
    final index = _cosechas.indexWhere((c) => c['uuid'] == editedCosecha['uuid']);
    if (index != -1) {
      setState(() {
        _cosechas[index] = editedCosecha;
      });
      _saveCosechas().then((_) => _loadCosechas());
    }
  }

  Future<void> _deleteCosecha(String uuid) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar eliminación'),
        content: const Text('¿Está seguro que desea eliminar este registro?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Eliminar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      setState(() {
        _cosechas.removeWhere((c) => c['uuid'] == uuid);
      });
      await _saveCosechas();
      await _loadCosechas();
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
            title: Text(
              '${cosecha['fruta'] ?? 'Fruta desconocida'}' +
                  (cosecha['editado'] == true ? ' (editado)' : ''),
            ),
            subtitle: Text(
              'Variedad: ${cosecha['variedad'] ?? '-'}\n'
              'Fecha: ${cosecha['fecha'] ?? '-'}',
            ),
            isThreeLine: true,
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteCosecha(cosecha['uuid']),
              tooltip: 'Eliminar registro',
            ),
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HarvestDetailPage(
                    cosecha: cosecha,
                    onUpdate: _updateCosecha,
                  ),
                ),
              );
              await _loadCosechas();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.frutaFiltrada != null
            ? 'Registros de ${widget.frutaFiltrada}'
            : widget.title),
        backgroundColor: colorScheme.inversePrimary,
      ),
      body: RefreshIndicator(
        onRefresh: _loadCosechas,
        child: _buildCosechasList(),
      ),
    );
  }
}
