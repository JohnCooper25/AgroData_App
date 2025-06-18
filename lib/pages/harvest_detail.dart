import 'package:flutter/material.dart';
import 'package:AgroData/harvest_form.dart';

class HarvestDetailPage extends StatefulWidget {
  final Map<String, dynamic> cosecha;
  final void Function(Map<String, dynamic>)? onUpdate;

  const HarvestDetailPage({super.key, required this.cosecha, this.onUpdate});

  @override
  State<HarvestDetailPage> createState() => _HarvestDetailPageState();
}

class _HarvestDetailPageState extends State<HarvestDetailPage> {
  late Map<String, dynamic> _cosechaEditable;

  @override
  void initState() {
    super.initState();
    // Copiamos los datos para editar localmente
    _cosechaEditable = Map<String, dynamic>.from(widget.cosecha);
  }

  Future<void> _editarRegistro() async {
    final resultado = await Navigator.of(context).push<Map<String, dynamic>>(
      MaterialPageRoute(
        builder: (context) => HarvestForm(
          onSave: (editedData) {
            Navigator.of(context).pop(editedData);
          },
          // Para edición podemos pasar datos iniciales (lo añadimos luego)
          initialData: _cosechaEditable,
        ),
      ),
    );

    if (resultado != null) {
      setState(() {
        _cosechaEditable = Map<String, dynamic>.from(resultado);

        // Añadir (editado) al nombre fruta si no está
        if (!(_cosechaEditable['fruta'] ?? '').toString().contains('(editado)')) {
          _cosechaEditable['fruta'] = '${_cosechaEditable['fruta']} (editado)'; 
        }
      });

      // Comunicar al padre que se actualizó (si se pasó función)
      if (widget.onUpdate != null) {
        widget.onUpdate!(_cosechaEditable);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de Cosecha'),
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
            _buildReadOnlyField('Fruta', _cosechaEditable['fruta']),
            _buildReadOnlyField('Variedad', _cosechaEditable['variedad']),
            _buildReadOnlyField('Código de huerto', _cosechaEditable['codigoHuerto']),
            _buildReadOnlyField('Contratista', _cosechaEditable['contratista']),
            _buildReadOnlyField('Cantidad de gente', _cosechaEditable['cantidadGente']),
            _buildReadOnlyField('Cantidad de cuadrillas', _cosechaEditable['cantidadCuadrillas']),
            _buildReadOnlyField('Total de bins cosechados', _cosechaEditable['totalBins']),
            _buildReadOnlyField('Fecha de cosecha', _cosechaEditable['fecha']),
          ],
        ),
      ),
    );
  }
}
