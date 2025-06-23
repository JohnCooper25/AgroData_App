import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppData extends ChangeNotifier {
  // Tema
  ThemeMode _themeMode = ThemeMode.dark;
  bool get isDarkMode => _themeMode == ThemeMode.dark;
  ThemeMode get themeMode => _themeMode;

  // Permisos
  bool _allowEdit = true;
  bool _allowDelete = true;

  bool get allowEdit => _allowEdit;
  bool get allowDelete => _allowDelete;

  bool _protectProfileData = false;
  bool get protectProfileData => _protectProfileData;

  // Datos de perfil
  String _userName = 'Jonathan Catalan';
  String _phoneNumber = '';
  String _selectedHuerto = 'Agricola La Rosa';
  String _email = '';
  String _administration = '';

  String get userName => _userName;
  String get phoneNumber => _phoneNumber;
  String get selectedHuerto => _selectedHuerto;
  String get email => _email;
  String get administration => _administration;

  // Carga inicial de preferencias y perfil
  Future<void> loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    // Tema
    _themeMode = (prefs.getBool('dark_theme') ?? true) ? ThemeMode.dark : ThemeMode.light;

    // Permisos
    _allowEdit = prefs.getBool('allow_edits') ?? true;
    _allowDelete = prefs.getBool('allow_delete') ?? true;

    // Perfil
    _userName = prefs.getString('userName') ?? 'Jonathan Catalan';
    _phoneNumber = prefs.getString('phoneNumber') ?? '';
    _selectedHuerto = prefs.getString('huerto') ?? 'Agricola La Rosa';
    _email = prefs.getString('email') ?? '';
    _administration = prefs.getString('administration') ?? '';
    _protectProfileData = prefs.getBool('protect_profile_data') ?? false;

    notifyListeners();
  }

  // Tema
  Future<void> toggleTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('dark_theme', isDark);
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  // Permisos edicion
  Future<void> toggleAllowEdit(bool allow) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('allow_edits', allow);
    _allowEdit = allow;
    notifyListeners();
  }

  // Permisos eliminar
  Future<void> toggleAllowDelete(bool allow) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('allow_delete', allow);
    _allowDelete = allow;
    notifyListeners();
  }

  Future<void> toggleProtectProfileData(bool value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('protect_profile_data', value);
  _protectProfileData = value;
  notifyListeners();
  }

  // Perfil: nombre
  Future<void> updateUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    _userName = name;
    notifyListeners();
  }

  // Perfil: telefono
  Future<void> updatePhoneNumber(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('phoneNumber', phone);
    _phoneNumber = phone;
    notifyListeners();
  }

  // Perfil: huerto
  Future<void> updateHuerto(String huerto) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('huerto', huerto);
    _selectedHuerto = huerto;
    notifyListeners();
  }

  // Perfil: correo
  Future<void> updateEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    _email = email;
    notifyListeners();
  }

  // Perfil: administracion
  Future<void> updateAdministration(String administration) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('administration', administration);
    _administration = administration;
    notifyListeners();

  }
  Future<void> setUserName(String name) async {
    _userName = name;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    notifyListeners();
  }

  Future<void> setPhoneNumber(String phone) async {
    _phoneNumber = phone;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('phoneNumber', phone);
    notifyListeners();
  }

  Future<void> setHuerto(String huerto) async {
    _selectedHuerto = huerto;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('huerto', huerto);
    notifyListeners();
  }

  Future<void> setEmail(String email) async {
    _email = email;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    notifyListeners();
  }

  Future<void> setAdministracion(String administracion) async {
    _administration = administracion;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('administracion', administracion);
    notifyListeners();
  }
}

