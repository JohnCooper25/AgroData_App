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
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
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
                    .map<DropdownMenuItem<String>>((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 16),

              
              TextFormField(
                controller: _varietyController,
                decoration: const InputDecoration(labelText: 'Nombre de la variedad'),
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
                decoration: const InputDecoration(labelText: 'Total de bins cosechados'),
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
              ),

              const SizedBox(height: 24),

             
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      
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
