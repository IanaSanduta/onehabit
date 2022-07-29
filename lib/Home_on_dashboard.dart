import 'dart:math';

import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:onehabit/themes/color.dart';

class Home_on_dashboard extends StatefulWidget {
  const Home_on_dashboard({Key? key}) : super(key: key);

  @override
  State<Home_on_dashboard> createState() => _Home_on_dashboardState();
}

class _Home_on_dashboardState extends State<Home_on_dashboard> {
  DateTime? selectedDate;
  Random random = new Random();

  @override
  void initState() {
    setState(() {
      selectedDate = DateTime.now();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(
        backButton: false,
        white: Colors.white,
        black: Colors.black,
        accent: Purple,
        //padding: 30.0,
        fullCalendar: true,
        onDateChanged: (value) => setState(() => selectedDate = value),
        lastDate: DateTime.now(),
        events: List.generate(
            100,
            (index) => DateTime.now()
                .subtract(Duration(days: index * random.nextInt(5)))),
      ),
      body: Center(
        //scrollDirection: Axis.horizontal,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(selectedDate.toString()),
        ]),
      ),
    );
  }
}
