import 'package:flutter/material.dart';
import 'package:onehabit/Login.dart';
import 'package:onehabit/themes/Buttons/button_styles.dart';
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _backButton(),
            SizedBox(width: 250),
            Icon(Icons.password, color: Purple, size: 80),
            const Text(
              'Reset Password',
              style: TextStyle(fontFamily: 'outfit', fontSize: 55),
            ),
            _email(),
            _newPassword(),
            _confirmPassword(),
            TextButton(
              onPressed: navigateToLogin,
              child: const Text("Reset"),
              style: defaultButton(),
            ),
          ],
        ),
      ),
    );
  }

  _backButton() => Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(width: 15),
        IconButton(
          icon: Icon(Icons.arrow_back, color: Purple, size: 30),
          onPressed: () {
            Navigator.pop(context);
            //ModalRoute.of(context)?.canPop
          },
        ),
      ]);

  _iconObscure() => IconButton(
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

  SizedBox _email() {
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

  SizedBox _newPassword() {
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
          hintText: 'Enter new password',
          prefixIcon: Icon(
            Icons.lock,
            color: Purple,
          ),
          suffixIcon: _iconObscure(),
        ),
      ),
    );
  }

  SizedBox _confirmPassword() {
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
          hintText: 'Confirm password',
          prefixIcon: Icon(
            Icons.lock,
            color: Purple,
          ),
          suffixIcon: _iconObscure(),
        ),
      ),
    );
  }

  void navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }
}
