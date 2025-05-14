import 'package:flutter/material.dart';
import 'Pages/home.dart';
import 'Pages/new_Harvest.dart';
import 'Pages/profile.dart';
import 'Pages/splash.dart ';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agro_Data',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'AgroData'),
    );
  }
}

