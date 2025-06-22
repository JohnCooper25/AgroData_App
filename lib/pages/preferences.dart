import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  bool _allowEdits = true;
  bool _darkTheme = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _allowEdits = prefs.getBool('allow_edits') ?? true; // por defecto: true
      _darkTheme = prefs.getBool('dark_theme') ?? true; // por defecto: true
    });
  }

  Future<void> _toggleEdits(bool newValue) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('allow_edits', newValue);
    setState(() {
      _allowEdits = newValue;
    });
  }

  Future<void> _toggleTheme(bool newValue) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('dark_theme', newValue);
    setState(() {
      _darkTheme = newValue;
    });
    Future.delayed(const Duration(milliseconds: 300), () {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferencias'),
        backgroundColor: theme.colorScheme.primary,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Permitir edición de registros'),
            subtitle: const Text('Activa o desactiva la posibilidad de editar registros existentes.'),
            value: _allowEdits,
            onChanged: _toggleEdits,
          ),
          SwitchListTile(
            title: const Text('Tema oscuro'),
            subtitle: const Text('Activa o desactiva el modo oscuro en la app.'),
            value: _darkTheme,
            onChanged: _toggleTheme,
          ),
        ],
      ),
    );
  }
}
