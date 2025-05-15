import 'package:flutter/material.dart';
import 'pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgroData',
      theme: ThemeData(
        fontFamily: 'Merriweather',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 71, 222, 96)),
      ),
      home: const MySplashPage(), 
    );
  }
}
