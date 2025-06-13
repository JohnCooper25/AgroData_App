import 'package:flutter/material.dart';
import 'theme.dart';
import 'pages/home.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgroData',
      theme: MaterialTheme(ThemeData.dark().textTheme).dark(),
      home: const MyHomePage(title: 'AgroData'), 
    );
  }
}
