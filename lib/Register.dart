import 'package:flutter/material.dart';
import 'package:onehabit/Dashboard.dart';
import 'package:onehabit/themes/color.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var styleInput = const TextStyle(color: Colors.white);
  var _isObscure = true;
  var _password1 = '';
  var _password2 = '';

  String? validatePassword(String? value) {
    if (value == null) {
      return null;
    }

    if (value.isEmpty) {
      return "Passwords are required";
    }

    if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,20}$')
        .hasMatch(value)) {
      return ''' Password must be at least 8 character, 
      and at least 1 uppercase, 1 lowercase, 
      1 number, and 1 symbol.''';
    }

    var pass1 = _password1.toString().trim();
    var pass2 = _password2.toString().trim();

    if (pass1 != pass2) {
      return "Please make sure your passwords match";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    var iconObscure = IconButton(
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
    return Scaffold(
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(width: 15),
            IconButton(
              icon: Icon(Icons.arrow_back, color: Purple, size: 30),
              onPressed: () {
                Navigator.pop(context);
                //ModalRoute.of(context)?.canPop
              },
            ),
          ]),
          SizedBox(width: 250),
          Icon(Icons.person, color: Purple, size: 80),
          const Text(
            'Register',
            style: TextStyle(fontFamily: 'outfit', fontSize: 55),
          ),
          SizedBox(
            width: 280,
            child: TextField(
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Purple, width: 4.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Purple, width: 3.0),
                ),
                hintText: 'Enter your name',
                prefixIcon: Icon(
                  Icons.person,
                  color: Purple,
                ),
              ),
            ),
          ),
          SizedBox(
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
          ),
          SizedBox(
            width: 280,
            child: TextFormField(
              obscureText: _isObscure,
              validator: validatePassword,
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
          ),
          SizedBox(
            width: 280,
            child: TextFormField(
              obscureText: _isObscure,
              validator: validatePassword,
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Purple, width: 4.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Purple, width: 3.0),
                ),
                hintText: 'Confirm password',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Purple,
                ),
                suffixIcon: iconObscure,
              ),
            ),
          ),
          TextButton(
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
            child: const Text("Register"),
          ),
        ]),
      ),
    );
  }
}
