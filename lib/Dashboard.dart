import 'package:flutter/material.dart';
import 'package:onehabit/themes/color.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  var _currentIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(width: 15),
            IconButton(
              icon: Icon(Icons.menu, color: Purple, size: 30),
              onPressed: () {
                Navigator.pop(context);
                //ModalRoute.of(context)?.canPop
              },
            ),
          ]),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(30)),
            ),
            child: const SizedBox(
              width: 300,
              height: 100,
              child: Center(
                child: Text(
                  'Outlined Card',
                  style: TextStyle(
                    fontFamily: 'bevietnampro',
                    fontSize: 25,
                    color: LightBack,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: SalomonBottomBar(
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
      ),
    );
  }
}
