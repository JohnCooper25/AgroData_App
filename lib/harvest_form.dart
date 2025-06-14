import 'package:flutter/material.dart';

class HarvestForm extends StatefulWidget {
  final void Function(Map<String, dynamic>) onSave;

  const HarvestForm({super.key, required this.onSave});

  @override
  State<HarvestForm> createState() => _HarvestFormState();
}

class _HarvestFormState extends State<HarvestForm> {
  final _formKey = GlobalKey<FormState>();

  String _selectedFruit = 'Ciruela';
  final TextEditingController _varietyController = TextEditingController();
  final TextEditingController _orchardCodeController = TextEditingController();
  final TextEditingController _contractorController = TextEditingController();
  final TextEditingController _peopleCountController = TextEditingController();
  final TextEditingController _crewCountController = TextEditingController();
  final TextEditingController _binsCountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final cosecha = {
        'fruta': _selectedFruit,
        'variedad': _varietyController.text,
        'codigoHuerto': _orchardCodeController.text,
        'contratista': _contractorController.text,
        'cantidadGente': _peopleCountController.text,
        'cantidadCuadrillas': _crewCountController.text,
        'totalBins': _binsCountController.text,
        'fecha': _dateController.text,
      };
      widget.onSave(cosecha);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Selecciona la fruta:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                DropdownButton<String>(
                  value: _selectedFruit,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedFruit = newValue!;
                    });
                  },
                  items: ['Ciruela', 'Pera', 'Naranja']
                      .map<DropdownMenuItem<String>>(
                          (value) => DropdownMenuItem(value: value, child: Text(value)))
                      .toList(),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _varietyController,
                  decoration:
                      const InputDecoration(labelText: 'Nombre de la variedad'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Ingrese variedad' : null,
                ),
                TextFormField(
                  controller: _orchardCodeController,
                  decoration: const InputDecoration(labelText: 'Código de huerto'),
                ),
                TextFormField(
                  controller: _contractorController,
                  decoration: const InputDecoration(labelText: 'Contratista'),
                ),
                TextFormField(
                  controller: _peopleCountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Cantidad de gente'),
                ),
                TextFormField(
                  controller: _crewCountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Cantidad de cuadrillas'),
                ),
                TextFormField(
                  controller: _binsCountController,
                  keyboardType: TextInputType.number,
                  decoration:
                      const InputDecoration(labelText: 'Total de bins cosechados'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  decoration: const InputDecoration(
                    labelText: 'Fecha de cosecha',
                    prefixIcon: Icon(Icons.calendar_today),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Seleccione fecha' : null,
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: _saveForm,
                    child: const Text('Guardar datos'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
