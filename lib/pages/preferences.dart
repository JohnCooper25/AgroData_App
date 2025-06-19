import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  bool _allowEdits = true;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _allowEdits = prefs.getBool('allow_edits') ?? true; // por defecto: true
    });
  }

  Future<void> _toggleEdits(bool newValue) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('allow_edits', newValue);
    setState(() {
      _allowEdits = newValue;
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
        ],
      ),
    );
  }
}
