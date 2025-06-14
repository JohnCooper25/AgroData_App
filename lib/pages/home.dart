import 'package:flutter/material.dart';
import 'new_Harvest.dart';
import 'profile.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkInternetConnection() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static final List<Widget> _widgetOptions = <Widget>[
    Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/backgrounds/background_home.png'),
        fit: BoxFit.fill,
      ),
    ),
  ),
    Text('Index 1: Perfil de Usuario', style: optionStyle),
    Text('Index 2: Nueva Cosecha', style: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
      Text('Index 1: Perfil de Usuario', style: textTheme.headlineMedium),
      Text('Index 2: Nueva Cosecha', style: textTheme.headlineMedium),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: Center(child: _widgetOptions[_selectedIndex]),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyProfilePage(title: 'Profile'),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Nueva Cosecha'),
              selected: _selectedIndex == 2,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyNew_HarvestPage(title: 'New Harvest'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
