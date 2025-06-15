import 'package:flutter/material.dart';

class HarvestForm extends StatefulWidget {
  final void Function(Map<String, dynamic>) onSave;
  final Map<String, dynamic>? initialData; // <-- Nuevo parámetro opcional

  const HarvestForm({super.key, required this.onSave, this.initialData});

  @override
  State<HarvestForm> createState() => _HarvestFormState();
}

class _HarvestFormState extends State<HarvestForm> {
  final _formKey = GlobalKey<FormState>();

  late String _selectedFruit;
  late TextEditingController _varietyController;
  late TextEditingController _orchardCodeController;
  late TextEditingController _contractorController;
  late TextEditingController _peopleCountController;
  late TextEditingController _crewCountController;
  late TextEditingController _binsCountController;
  late TextEditingController _dateController;
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();

    // Si hay datos iniciales, precargarlos; sino valores por defecto
    _selectedFruit = widget.initialData?['fruta']?.toString().replaceAll(' (editado)', '') ?? 'Ciruela';
    _varietyController = TextEditingController(text: widget.initialData?['variedad'] ?? '');
    _orchardCodeController = TextEditingController(text: widget.initialData?['codigoHuerto'] ?? '');
    _contractorController = TextEditingController(text: widget.initialData?['contratista'] ?? '');
    _peopleCountController = TextEditingController(text: widget.initialData?['cantidadGente'] ?? '');
    _crewCountController = TextEditingController(text: widget.initialData?['cantidadCuadrillas'] ?? '');
    _binsCountController = TextEditingController(text: widget.initialData?['totalBins'] ?? '');
    _dateController = TextEditingController(text: widget.initialData?['fecha'] ?? '');

    // Opcional: Si quieres parsear la fecha inicial para _selectedDate, se puede agregar aquí.
  }

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
