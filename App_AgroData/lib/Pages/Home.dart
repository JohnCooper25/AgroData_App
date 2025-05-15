import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/New_Harvest.dart';
import 'package:flutter_application_1/Pages/profile.dart';

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
    Text('Index 1: Profile', style: optionStyle),
    Text('Index 2: New Harvest', style: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 123, 200, 126)),
              child: Text('Menu'),
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
              title: const Text('Profile'),
              selected: _selectedIndex == 1,
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProfilePage(title: 'Profile')));  
                
              },
            ),
            ListTile(
              title: const Text('New Harvest'),
              selected: _selectedIndex == 2,
              onTap: () {
               
               Navigator.push(context, MaterialPageRoute(builder: (context) => const MyNew_HarvestPage(title: 'New Harvest')));  
               
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
