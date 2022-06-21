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
    const TextStyle optionStyle =
        // TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
        TextStyle(fontFamily: 'outfit', fontSize: 15);
    const List<Widget> _widgetOptions = <Widget>[
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        /*shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),*/
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(height: 50),
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
      bottomNavigationBar: BottomNavBar(),
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
