import 'package:flutter/material.dart';
import 'package:onehabit/themes/color.dart';

class MyHomeBottomNavBar extends StatefulWidget {
  const MyHomeBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyHomeBottomNavBar> createState() => _MyHomeBottomNavBar();
}

class _MyHomeBottomNavBar extends State<MyHomeBottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      // TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
      TextStyle(fontFamily: 'outfit', fontSize: 15);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.shifting,
        backgroundColor: Color(0xFF6200EE),
        selectedItemColor: AccentColor,
        unselectedItemColor: Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.task_alt),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: AccentColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
