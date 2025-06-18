import 'package:flutter/material.dart';
import 'maintenance_form.dart';

class MaintenanceDetailPage extends StatefulWidget {
  final Map<String, dynamic> mantencion;
  final void Function(Map<String, dynamic>)? onUpdate;

  const MaintenanceDetailPage({
    super.key,
    required this.mantencion,
    this.onUpdate,
  });

  @override
  State<MaintenanceDetailPage> createState() => _MaintenanceDetailPageState();
}

class _MaintenanceDetailPageState extends State<MaintenanceDetailPage> {
  late Map<String, dynamic> _mantencionEditable;

  @override
  void initState() {
    super.initState();
    // Copiamos localmente para editar sin alterar el original directamente
    _mantencionEditable = Map<String, dynamic>.from(widget.mantencion);
  }

 Future<void> _editarRegistro() async {
  final resultado = await Navigator.of(context).push<Map<String, dynamic>>(
    MaterialPageRoute(
      builder: (context) => MaintenanceForm(
        onSave: (editedData) {
          Navigator.of(context).pop(editedData);
        },
        initialData: _mantencionEditable,
      ),
    ),
  );

  if (resultado != null) {
    setState(() {
      _mantencionEditable = Map<String, dynamic>.from(resultado);
    });

    if (widget.onUpdate != null) {
      widget.onUpdate!(_mantencionEditable);
    }
  }
}

  Widget _buildReadOnlyField(String label, dynamic value) {
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

  Widget _buildChecklist(Map<String, bool>? checklist) {
    if (checklist == null) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: checklist.entries.map((e) {
        return Row(
          children: [
            Checkbox(value: e.value, onChanged: null),
            Expanded(child: Text(e.key)),
          ],
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de Mantención'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Editar registro',
            onPressed: _editarRegistro,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _buildReadOnlyField('Marca', _mantencionEditable['marca']),
            _buildReadOnlyField('Modelo', _mantencionEditable['modelo']),
            _buildReadOnlyField('Código', _mantencionEditable['codigo']),
            const SizedBox(height: 16),
            const Text(
              'Mantenciones realizadas:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            _buildChecklist(_mantencionEditable['mantenciones']?.cast<String, bool>()),
            const SizedBox(height: 16),
            _buildReadOnlyField('Reparaciones extras', _mantencionEditable['reparacionesExtras']),
            _buildReadOnlyField('Mecánico', _mantencionEditable['mecanico']),
          ],
        ),
      ),
    );
  }
}
