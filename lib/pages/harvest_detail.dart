import 'package:flutter/material.dart';

class HarvestDetailPage extends StatelessWidget {
  final Map<String, dynamic> cosecha;

  const HarvestDetailPage({super.key, required this.cosecha});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de Cosecha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildField('Fruta', cosecha['fruta']),
            _buildField('Variedad', cosecha['variedad']),
            _buildField('Fecha', cosecha['fecha']),
            _buildField('Cantidad (kg)', cosecha['cantidad']),
            _buildField('Notas', cosecha['notas']),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        readOnly: true,
        initialValue: value?.toString() ?? '',
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
