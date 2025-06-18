// home.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'registration_maintenance.dart';
import 'maintenance_form.dart';
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
  bool _showMaintenanceForm = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _showHarvestForm = false;
      _showMaintenanceForm = false;
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

  Future<void> _saveMaintenance(Map<String, dynamic> newMaintenance) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? existing = prefs.getString('mantenciones');
    List<dynamic> mantenciones = existing != null ? jsonDecode(existing) : [];
    mantenciones.add(newMaintenance);
    await prefs.setString('mantenciones', jsonEncode(mantenciones));

    setState(() {
      _showMaintenanceForm = false;
      _selectedIndex = 0;
    });
  }

  void _navigateToFruta(String fruta) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RegistrosPage(
          title: 'Registros de $fruta',
          frutaFiltrada: fruta,
        ),
      ),
    );
  }

  void _navigateToMarca(String marca) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _RegistrosMantencionesPageState(
          title: 'Mantenciones de $marca',
          marcaFiltrada: marca,
        ),
      ),
    );
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
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
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
                    child: HarvestForm(onSave: _saveHarvest),
                  ),
                ),
              ),
            ),
          if (_showMaintenanceForm)
            Positioned.fill(
              child: Container(
                color: Colors.black54,
                child: Center(
                  child: SizedBox(
                    width: 400,
                    child: MaintenanceForm(onSave: _saveMaintenance),
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
              decoration: BoxDecoration(color: colorScheme.primaryContainer),
              child: Text(
                'Menú',
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
            ExpansionTile(
              title: const Text('Registros'),
              children: [
                ExpansionTile(
                  title: const Text('Cosechas'),
                  children: [
                    ListTile(
                      title: const Text('Ciruela'),
                      onTap: () => _navigateToFruta('Ciruela'),
                    ),
                    ListTile(
                      title: const Text('Pera'),
                      onTap: () => _navigateToFruta('Pera'),
                    ),
                    ListTile(
                      title: const Text('Naranja'),
                      onTap: () => _navigateToFruta('Naranja'),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: const Text('Mantenciones'),
                  children: [
                    ListTile(
                      title: const Text('Deutz Fahr'),
                      onTap: () => _navigateToMarca('Deutz Fahr'),
                    ),
                    ListTile(
                      title: const Text('Kubota'),
                      onTap: () => _navigateToMarca('Kubota'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: (_selectedIndex == 0 && !_showHarvestForm && !_showMaintenanceForm)
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
                          ExpansionTile(
                            title: const Text('Mantenciones'),
                            children: [
                              ListTile(
                                title: const Text('Deutz Fahr'),
                                onTap: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    _showMaintenanceForm = true;
                                  });
                                },
                              ),
                              ListTile(
                                title: const Text('Kubota'),
                                onTap: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    _showMaintenanceForm = true;
                                  });
                                },
                              ),
                            ],
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
