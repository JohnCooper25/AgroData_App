import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'pages/home.dart';
import 'provider/app_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appData = AppData();
  await appData.loadPreferences();

  runApp(
    ChangeNotifierProvider(
      create: (_) => appData,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<AppData>().themeMode;

    return MaterialApp(
      title: 'AgroData',
      theme: MaterialTheme().light(),
      darkTheme: MaterialTheme().dark(),
      themeMode: themeMode,
      home: const MyHomePage(title: 'AgroData'),
    );
  }
}
