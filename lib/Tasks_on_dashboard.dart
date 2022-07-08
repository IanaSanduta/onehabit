import 'package:flutter/material.dart';

class Tasks_on_dashboard extends StatefulWidget {
  const Tasks_on_dashboard({Key? key}) : super(key: key);

  @override
  State<Tasks_on_dashboard> createState() => _Tasks_on_dashboardState();
}

class _Tasks_on_dashboardState extends State<Tasks_on_dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //scrollDirection: Axis.horizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'One habit',
              style: TextStyle(fontFamily: 'outfit', fontSize: 55),
            ),
            SizedBox(
              width: 280,
              child: const Text(
                'Explore some of the tips to help boost your productivity throughout  the day ',
                style: TextStyle(
                  fontFamily: 'bevietnampro',
                  fontSize: 25,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Don't have an account yet?",
                      style: TextStyle(
                        fontFamily: 'bevietnampro',
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ]),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [])
            ])),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
