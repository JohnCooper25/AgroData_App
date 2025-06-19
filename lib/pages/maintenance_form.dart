import 'package:flutter/material.dart';

class MaintenanceForm extends StatefulWidget {
  final void Function(Map<String, dynamic>) onSave;
  final Map<String, dynamic> initialData;

  const MaintenanceForm({
    super.key,
    required this.onSave,
    required this.initialData, required marca,
  });

  @override
  State<MaintenanceForm> createState() => _MaintenanceFormState();
}

class _MaintenanceFormState extends State<MaintenanceForm> {
  late String _selectedBrand;
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _modelController;
  late TextEditingController _codeController;
  late TextEditingController _extraRepairsController;
  late TextEditingController _mechanicController;

  late Map<String, bool> _checklist;

  final Map<String, bool> _defaultChecklist = {
    'Filtro de aceite de motor': false,
    'Filtro de aire EXT': false,
    'Filtro de aire INT': false,
    'Filtro de aceite hidraulico': false,
    'Filtro de petroleo': false,
  };

  @override
  void initState() {
    super.initState();

    // Inicializar marca
    _selectedBrand = widget.initialData['marca'] ?? 'Deutz Fahr';

    // Inicializar checklist con datos o default
    final savedChecklist = widget.initialData['mantenciones'];
    if (savedChecklist != null && savedChecklist is Map<String, dynamic>) {
      _checklist = Map<String, bool>.from(
          savedChecklist.map((key, value) => MapEntry(key, value == true)));
    } else {
      _checklist = Map<String, bool>.from(_defaultChecklist);
    }

    // Inicializar controladores con datos o vacíos
    _modelController = TextEditingController(text: widget.initialData['modelo'] ?? '');
    _codeController = TextEditingController(text: widget.initialData['codigo'] ?? '');
    _extraRepairsController = TextEditingController(text: widget.initialData['reparacionesExtras'] ?? '');
    _mechanicController = TextEditingController(text: widget.initialData['mecanico'] ?? '');
  }

  @override
  void dispose() {
    _modelController.dispose();
    _codeController.dispose();
    _extraRepairsController.dispose();
    _mechanicController.dispose();
    super.dispose();
  }

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      final mantenimiento = {
        'uuid': widget.initialData['uuid'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
        'marca': _selectedBrand,
        'modelo': _modelController.text,
        'codigo': _codeController.text,
        'mantenciones': _checklist,
        'reparacionesExtras': _extraRepairsController.text,
        'mecanico': _mechanicController.text,
      };
      widget.onSave(mantenimiento);
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
                  'Selecciona la marca:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => _selectedBrand = 'Deutz Fahr'),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/logos/deutz.png',
                            height: 50,
                            color: _selectedBrand == 'Deutz Fahr' ? null : Colors.grey[400],
                          ),
                          Radio<String>(
                            value: 'Deutz Fahr',
                            groupValue: _selectedBrand,
                            onChanged: (value) {
                              setState(() {
                                _selectedBrand = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => setState(() => _selectedBrand = 'Kubota'),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/logos/kubota.png',
                            height: 50,
                            color: _selectedBrand == 'Kubota' ? null : Colors.grey[400],
                          ),
                          Radio<String>(
                            value: 'Kubota',
                            groupValue: _selectedBrand,
                            onChanged: (value) {
                              setState(() {
                                _selectedBrand = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _modelController,
                  decoration: const InputDecoration(labelText: 'Modelo de maquinaria'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Ingrese el modelo' : null,
                ),
                TextFormField(
                  controller: _codeController,
                  decoration: const InputDecoration(labelText: 'Código de maquinaria'),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Mantención realizada:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                ..._checklist.keys.map((item) => CheckboxListTile(
                      title: Text(item),
                      value: _checklist[item],
                      onChanged: (bool? value) {
                        setState(() {
                          _checklist[item] = value ?? false;
                        });
                      },
                    )),
                const SizedBox(height: 16),
                const Text('Reparaciones extras:'),
                TextFormField(
                  controller: _extraRepairsController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Describa reparaciones adicionales si las hay',
                  ),
                ),
                const SizedBox(height: 16),
                const Text('Nombre del mecánico:'),
                TextFormField(
                  controller: _mechanicController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Ej: Juan Pérez',
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton(
                    onPressed: _saveForm,
                    child: const Text('Guardar mantención'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
