import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:AgroData/harvest_form.dart';
import 'registration.dart';
import 'profile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool _showHarvestForm = false;

  final GlobalKey<RegistrosPageState> _registrosKey = GlobalKey<RegistrosPageState>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _showHarvestForm = false;
    });
  }

  Future<void> _saveHarvest(Map<String, dynamic> newHarvest) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? existing = prefs.getString('cosechas');
    List<dynamic> cosechas = existing != null ? jsonDecode(existing) : [];
    cosechas.add(newHarvest);
    await prefs.setString('cosechas', jsonEncode(cosechas));

    setState(() {
      _showHarvestForm = false;
      _selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final List<Widget> _widgetOptions = <Widget>[
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backgrounds/background_home.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
      const MyProfilePage(title: 'Perfil de Usuario'),
      const RegistrosPage(title: 'Registros'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              tooltip: 'Abrir Menu',
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Stack(
        children: [
          Center(child: _widgetOptions[_selectedIndex]),
          if (_showHarvestForm)
            Positioned.fill(
              child: Container(
                color: Colors.black54,
                child: Center(
                  child: SizedBox(
                    width: 400,
                    child: HarvestForm(
                      onSave: _saveHarvest,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
              ),
              child: Text(
                'Menu',
                style: textTheme.headlineSmall?.copyWith(
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Perfil de Usuario'),
              selected: _selectedIndex == 1,
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Registros'),
              selected: _selectedIndex == 2,
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: (_selectedIndex == 0 && !_showHarvestForm)
          ? FloatingActionButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return SafeArea(
                      child: Wrap(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.add),
                            title: const Text('Nueva Cosecha'),
                            onTap: () {
                              Navigator.pop(context);
                              setState(() {
                                _showHarvestForm = true;
                              });
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.build),
                            title: const Text('Registro de Mantenciones'),
                            onTap: () {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Funcionalidad en mantenciones pendiente'),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              tooltip: 'Agregar registro',
              child: const Icon(Icons.add),
            )
          : null,
    );
  }
}
