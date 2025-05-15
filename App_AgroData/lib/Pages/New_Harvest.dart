import 'package:flutter/material.dart';

class MyNew_HarvestPage extends StatefulWidget {
  const MyNew_HarvestPage({super.key, required this.title});

  final String title;

  @override
  State<MyNew_HarvestPage> createState() => _MyNew_HarvestState();
}

class _MyNew_HarvestState extends State<MyNew_HarvestPage> {
  final _formKey = GlobalKey<FormState>();

  String _selectedFruit = 'Ciruela';
  final TextEditingController _varietyController = TextEditingController();
  final TextEditingController _orchardCodeController = TextEditingController();
  final TextEditingController _contractorController = TextEditingController();
  final TextEditingController _peopleCountController = TextEditingController();
  final TextEditingController _crewCountController = TextEditingController();
  final TextEditingController _binsCountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dropdown para fruta
              const Text("Selecciona la fruta:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              DropdownButton<String>(
                value: _selectedFruit,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedFruit = newValue!;
                  });
                },
                items: ['Ciruela', 'Pera', 'Naranja']
                    .map<DropdownMenuItem<String>>((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 16),

              // Campo: Variedad
              TextFormField(
                controller: _varietyController,
                decoration: const InputDecoration(labelText: 'Nombre de la variedad'),
              ),

              // Campo: Código de huerto
              TextFormField(
                controller: _orchardCodeController,
                decoration: const InputDecoration(labelText: 'Código de huerto'),
              ),

              // Campo: Contratista
              TextFormField(
                controller: _contractorController,
                decoration: const InputDecoration(labelText: 'Contratista'),
              ),

              // Campo: Cantidad de gente
              TextFormField(
                controller: _peopleCountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Cantidad de gente'),
              ),

              // Campo: Cantidad de cuadrillas
              TextFormField(
                controller: _crewCountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Cantidad de cuadrillas'),
              ),

              // Campo: Bins cosechados
              TextFormField(
                controller: _binsCountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Total de bins cosechados'),
              ),

              const SizedBox(height: 20),
              // Botón opcional
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Puedes guardar o enviar los datos aquí
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('✅ Registro exitoso'),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: const Text('Guardar datos'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
