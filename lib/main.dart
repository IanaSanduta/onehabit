import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onehabit/Login.dart';
import 'package:onehabit/Views/Register_%20view.dart';

import './themes/color.dart';
import 'firebase_options.dart';

Future<void> main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'One Habit',
      theme: MyTheme.defaultTheme,
      debugShowCheckedModeBanner: false,
      //primarySwatch: Colors.Purple,,
      home: const MyHomePage(title: 'One Habit'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //scrollDirection: Axis.horizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImageLogo(),
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
            LoginButton(),
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
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                RegisterButton(),
              ])
            ])),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  ImageLogo() => Image.asset(
        'assets/images/newLogo.png',
        height: 300,
        width: 400,
      );

  LoginButton() => TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Login()),
          );
        },
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Purple),
          padding: MaterialStateProperty.all<EdgeInsets>(
              EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(
              color: Purple,
              width: 3.0,
            ),
          )),
        ),
        child: const Text("Login"),
      );

  RegisterButton() => TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RegisterView()),
          );
        },
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Purple),
        ),
        child: const Text("Register"),
      );
}
