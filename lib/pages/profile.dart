import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_data.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key, required this.title});

  final String title;

  @override
  State<MyProfilePage> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfilePage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _administrationController = TextEditingController();

  final List<String> _huertos = [
    'Agricola La Rosa',
    'Agricola Sofruco',
    'Cornellana',
  ];

  String? _selectedHuerto;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final appData = Provider.of<AppData>(context);
    _nameController.text = appData.userName;
    _phoneController.text = appData.phoneNumber;
    _selectedHuerto = appData.selectedHuerto;
    _emailController.text = appData.email;
    _administrationController.text = appData.administration;
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _administrationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final appData = Provider.of<AppData>(context);
    final bool protect = appData.protectProfileData;

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

            // Nombre de usuario
            TextField(
              controller: _nameController,
              enabled: !protect,
              decoration: const InputDecoration(
                labelText: 'Nombre de usuario',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              onChanged: (value) {
                appData.setUserName(value);
              },
            ),

            const SizedBox(height: 10),

            // Huerto (dropdown)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Huerto: ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                DropdownButton<String>(
                  value: _selectedHuerto,
                  onChanged: protect
                  ? null
                  : (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _selectedHuerto = newValue;
                        });
                        appData.updateHuerto(newValue);
                      }
                    },
                  items: _huertos
                      .map((huerto) =>
                          DropdownMenuItem(value: huerto, child: Text(huerto)))
                      .toList(),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Correo electrónico
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              onChanged: (value) {
                appData.setEmail(value);
              },
            ),

            const SizedBox(height: 10),

            // Administración
            TextField(
              controller: _administrationController,
              decoration: const InputDecoration(
                labelText: 'Administración',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.business),
              ),
              onChanged: (value) {
                appData.setAdministracion(value);
              },
            ),

            const SizedBox(height: 10),

            // Número de teléfono
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Número de teléfono',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
              onChanged: (value) {
                appData.setPhoneNumber(value);
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
            onPressed: protect
                ? null
                : () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Datos guardados')),
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
