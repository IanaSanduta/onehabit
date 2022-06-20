import 'package:flutter/material.dart';
import 'package:onehabit/Login.dart';
import 'package:onehabit/themes/color.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var _isObscure = true;
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
          Icon(Icons.password, color: Purple, size: 80),
          const Text(
            'Reset Password',
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
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Purple, width: 4.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Purple, width: 3.0),
                ),
                hintText: 'Enter new password',
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
            child: const Text("Reset"),
          ),
        ]),
      ),
    );
  }
}
