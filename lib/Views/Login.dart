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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 250),
                loginIcon,
                loginText,
                email(),
                password(),
                loginButton(),
              ],
            ),
            Visibility(
              child: errorAlert(),
              visible: true,
            ),
          ],
        ),
      ),
    );
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

  TextField loginTextField(
          String hintText, TextEditingController textController) =>
      TextField(
        controller: textController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Purple, width: 4.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Purple, width: 2.0),
          ),
          hintText: hintText,
          prefixIcon: Icon(
            Icons.lock,
            color: Purple,
          ),
        ),
      );

  Future<void> navigateToDashboard() async {
    isButtonPressed = true;
    print("Email to authenticate: " + emailController.text);
    bool isSignedIn = (await Authentication()
        .signInWithEmail(emailController.text, passwordController.text));
    if (isSignedIn) {
      isButtonPressed = false;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Dashboard()),
      );
    } else {
      signInAlertTitle = "Error signing in...";
      print("Error signing in... " + errorMessage);
    }
  }

  SizedBox password() => SizedBox(
        width: width,
        child: loginTextField("Enter your password", passwordController),
      );

  SizedBox email() => SizedBox(
        width: width,
        child: loginTextField("Enter your email", emailController),
      );
}
