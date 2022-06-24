import 'package:flutter/material.dart';
import 'package:onehabit/Dashboard.dart';
import 'package:onehabit/ForgotPassword.dart';
import 'package:onehabit/themes/color.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var styleInput = const TextStyle(color: Purple);
  var _isObscure = true;

  get iconObscure => IconButton(
        icon: Icon(
          _isObscure ? Icons.visibility : Icons.visibility_off,
          color: Purple,
        ),
        onPressed: () {
          setState(() {
            _isObscure = !_isObscure;
          });
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _backButton(),
          SizedBox(width: 250),
          Icon(Icons.person, color: Purple, size: 80),
          const Text(
            'Login',
            style: TextStyle(fontFamily: 'outfit', fontSize: 55),
          ),
          email(),
          password(),
          loginButton(),
          forgotPassword(),
        ]),
      ),
    );
  }

  Row _backButton() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(width: 15),
      IconButton(
        icon: Icon(Icons.arrow_back, color: Purple, size: 30),
        onPressed: () {
          Navigator.pop(context);
          //ModalRoute.of(context)?.canPop
        },
      ),
    ]);
  }

  SizedBox email() {
    return SizedBox(
      width: 280,
      child: TextField(
        decoration: new InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Purple, width: 4.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Purple, width: 3.0),
          ),
          hintText: 'Enter your email',
          prefixIcon: Icon(
            Icons.email,
            color: Purple,
          ),
        ),
      ),
    );
  }

  SizedBox password() {
    return SizedBox(
      width: 280,
      child: TextFormField(
        obscureText: _isObscure,
        decoration: new InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Purple, width: 4.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Purple, width: 3.0),
          ),
          hintText: 'Enter your password',
          prefixIcon: Icon(
            Icons.lock,
            color: Purple,
          ),
          suffixIcon: iconObscure,
        ),
      ),
    );
  }

  TextButton loginButton() {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Dashboard()),
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
  }

  SizedBox forgotPassword() {
    return SizedBox(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const Text(
          "Forgot Password?",
          style: TextStyle(
            fontFamily: 'bevietnampro',
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ]),
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ForgotPassword()),
            );
          },
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Purple),
          ),
          child: const Text("Reset"),
        ),
      ])
    ]));
  }
}
