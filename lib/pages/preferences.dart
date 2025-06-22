import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/app_data.dart';

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
    _loadAllowEdits();
  }

  Future<void> _loadAllowEdits() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _allowEdits = prefs.getBool('allow_edits') ?? true;
    });
  }

  Future<void> _toggleAllowEdits(bool newValue) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('allow_edits', newValue);
    setState(() {
      _allowEdits = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appData = Provider.of<AppData>(context);
    final isDark = appData.themeMode == ThemeMode.dark;
    final allowDelete = appData.allowDelete;

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
            onChanged: _toggleAllowEdits,
          ),
          SwitchListTile(
            title: const Text('Tema oscuro'),
            subtitle: const Text('Activa o desactiva el modo oscuro en la app.'),
            value: isDark,
            onChanged: (bool value) {
              appData.toggleTheme(value);
            },
          ),
          SwitchListTile(
            title: const Text('Permitir eliminación de registros'),
            subtitle: const Text('Activa o desactiva la posibilidad de borrar registros existentes.'),
            value: allowDelete,
            onChanged: (bool value) {
              appData.toggleAllowDelete(value);
            },
          ),
        ],
      ),
    );
  }
}
