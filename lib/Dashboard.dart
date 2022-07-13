import 'package:flutter/material.dart';
import 'package:onehabit/Home_on_dashboard.dart';
import 'package:onehabit/Stats_on_dashboard.dart';
import 'package:onehabit/themes/color.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'Tasks_on_dashboard.dart';
import 'Timer_on_dashboard.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var _currentIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List _widgetOptions = <Widget>[
    Home_on_dashboard(),
    Tasks_on_dashboard(),
    Stats_on_dashboard(),
    Timer_on_dashboard(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          backgroundColor: Purple,
          //elevation: 0,
        ),
        body: Center(
          child: _widgetOptions.elementAt(_currentIndex),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }

  BottomNavBar() => SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.space_dashboard),
            title: Text("Home"),
            selectedColor: Purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.add_task),
            title: Text("Tasks"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.auto_graph_sharp),
            title: Text("Stats"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.timer_rounded),
            title: Text("Timer"),
            selectedColor: Colors.teal,
          ),
        ],
      );
}
