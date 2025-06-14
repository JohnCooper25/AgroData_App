import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key, required this.title});

  final String title;

  @override
  State<MyProfilePage> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfilePage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  String _selectedHuerto = 'Agricola La Rosa';

  final List<String> _huertos = [
    'Agricola La Rosa',
    'Agricola Sofruco',
    'Cornellana',
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedPhone = prefs.getString('phoneNumber');
    String? savedHuerto = prefs.getString('huerto');
    String? savedName = prefs.getString('userName');

    if (savedPhone != null) {
      _phoneController.text = savedPhone;
    }
    if (savedHuerto != null && _huertos.contains(savedHuerto)) {
      setState(() {
        _selectedHuerto = savedHuerto;
      });
    }
    if (savedName != null) {
      _nameController.text = savedName;
    } else {
      _nameController.text = "Jonathan Catalan"; // Valor por defecto
    }
  }

  Future<void> _savePhone(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('phoneNumber', phone);
  }

  Future<void> _saveHuerto(String huerto) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('huerto', huerto);
  }

  Future<void> _saveName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Campo editable para el nombre
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre de usuario',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              onChanged: (value) {
                _saveName(value);
              },
            ),

            const SizedBox(height: 10),

            // Dropdown para elegir huerto
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Huerto: ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                DropdownButton<String>(
                  value: _selectedHuerto,
                  items: _huertos
                      .map((huerto) =>
                          DropdownMenuItem(value: huerto, child: Text(huerto)))
                      .toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _selectedHuerto = newValue;
                      });
                      _saveHuerto(newValue);
                    }
                  },
                ),
              ],
            ),

            const SizedBox(height: 40),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Número de teléfono',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String phone = _phoneController.text;
                _savePhone(phone);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Número guardado: $phone')),
                );
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
