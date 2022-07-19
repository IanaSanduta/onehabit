import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onehabit/Dashboard.dart';
import 'package:onehabit/Models/Authentication_model.dart';
import 'package:onehabit/themes/color.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // View variables
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

  var styleInput = const TextStyle(color: Colors.white);
  var loginButtonColor = MaterialStateProperty.all<Color>(Purple);
  var loginButtonPadding = MaterialStateProperty.all<EdgeInsets>(
      EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20));
  var loginButtonShape = MaterialStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
      side: BorderSide(
        color: Purple,
        width: 3.0,
      ),
    ),
  );
  Icon loginIcon = Icon(Icons.person, color: Purple, size: 80);
  Text loginText = const Text(
    'Login',
    style: TextStyle(fontFamily: 'outfit', fontSize: 55),
  );
  double width = 250;
  String errorMessage = "";

  // Credentials
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  late String signInAlertTitle = "Authenticating";
  bool isButtonPressed = false;
  bool isAuthenticationSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _backButton(),
                SizedBox(width: 250),
                loginIcon,
                loginText,
                email(),
                password(),
                loginButton(),
              ],
            ),
            /*Visibility(
              child: errorAlert(),
              visible: !isAuthenticationSuccess,
            ),*/
          ],
        ),
      ),
    );
  }

  Row _backButton() {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(width: 15),
      IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
        onPressed: () {
          Navigator.pop(context);
          //ModalRoute.of(context)?.canPop
        },
      ),
    ]);
  }

  AlertDialog errorAlert() {
    return AlertDialog(
      title: Text(signInAlertTitle),
      content: errorMessage.isEmpty
          ? Text(errorMessage)
          : CircularProgressIndicator(),
    );
  }

  ButtonStyle loginButtonStyle() => ButtonStyle(
        foregroundColor: loginButtonColor,
        padding: loginButtonPadding,
        shape: loginButtonShape,
      );

  TextButton loginButton() => TextButton(
        onPressed: navigateToDashboard,
        style: loginButtonStyle(),
        child: const Text("Login"),
      );

  /*TextField loginTextField(
          String hintText, TextEditingController textController, bool hide) =>
      TextField(
        obscureText: hide,
        controller: textController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Purple, width: 4.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Purple, width: 3.0),
          ),
          hintText: hintText,
          prefixIcon: Icon(
            Icons.lock,
            color: Purple,
          ),
          suffixIcon: iconObscure,
        ),
      );*/

  Future<void> navigateToDashboard() async {
    //isAuthenticationSuccess = false;
    //isButtonPressed = true;
    try {
      print("Email to authenticate: " + emailController.text);
      isAuthenticationSuccess = (await Authentication()
          .signInWithEmail(emailController.text, passwordController.text));
      if (isAuthenticationSuccess) {
        //isButtonPressed = false;

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
          (Route<dynamic> route) => false,
        );
        //isAuthenticationSuccess = false;
      } else {
        setState(() {});
        /*signInAlertTitle = "Error signing in...";
        print("Error signing in... " + errorMessage);*/
      }
    } on FirebaseAuthException catch (error) {
      //Shows a message in case of error.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(error.message!),
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.red.shade900),
      );
    }
  }

/*  SizedBox password() => SizedBox(
        width: width,
        child: loginTextField(
            "Enter your password", passwordController, _isObscure),
      );*/

  /* SizedBox email() => SizedBox(
        width: width,
        child: loginTextField("Enter your email", emailController, false),
      );
*/

  SizedBox email() {
    return SizedBox(
      width: 280,
      child: TextField(
        controller: emailController,
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
        controller: passwordController,
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

  BuildContext get get_context => context;
}
