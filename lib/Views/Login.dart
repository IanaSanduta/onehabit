import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onehabit/Dashboard.dart';
import 'package:onehabit/themes/color.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // View variables
  var _isObscure = true;
  String hintTextPassword = "Enter your password";

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

  Future<void> navigateToDashboard() async {
    //isAuthenticationSuccess = false;
    //isButtonPressed = true;
    try {
      print("Email to authenticate: " + emailController.text);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text);
      // await Authentication()
      //     .signInWithEmail(emailController.text, passwordController.text);
      // User? user = FirebaseAuth.instance.currentUser;
      //Authentication one = new Authentication();
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        //isButtonPressed = false;

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
          (Route<dynamic> route) => false,
        );
        //isAuthenticationSuccess = false;
      } else {
        setState(() {});
      }
    } on FirebaseAuthException catch (error) {
      print("Error signing in... " + errorMessage);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(error.message!),
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.red.shade900),
      );
    }
  }

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
          //: isAuthenticationSuccess ? null : errorMessage,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Purple, width: 4.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Purple, width: 3.0),
          ),
          hintText: hintTextPassword,
          prefixIcon: Icon(
            Icons.lock,
            color: Purple,
          ),
          suffixIcon: iconObscure,
        ),
      ),
    );
  }
}

//
// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   // View variables
//   var _isObscure = true;
//   String hintTextPassword = "Enter your password";
//
//   get iconObscure => IconButton(
//         icon: Icon(
//           _isObscure ? Icons.visibility : Icons.visibility_off,
//           color: Purple,
//         ),
//         onPressed: () {
//           setState(() {
//             _isObscure = !_isObscure;
//           });
//         },
//       );
//
//   var styleInput = const TextStyle(color: Colors.white);
//   var loginButtonColor = MaterialStateProperty.all<Color>(Purple);
//   var loginButtonPadding = MaterialStateProperty.all<EdgeInsets>(
//       EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20));
//   var loginButtonShape = MaterialStateProperty.all(
//     RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(30.0),
//       side: BorderSide(
//         color: Purple,
//         width: 3.0,
//       ),
//     ),
//   );
//   Icon loginIcon = Icon(Icons.person, color: Purple, size: 80);
//   Text loginText = const Text(
//     'Login',
//     style: TextStyle(fontFamily: 'outfit', fontSize: 55),
//   );
//   double width = 250;
//   String errorMessage = "";
//
//   // Credentials
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//   late String signInAlertTitle = "Authenticating";
//   bool isButtonPressed = false;
//   bool isAuthenticationSuccess = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _backButton(),
//                 SizedBox(width: 250),
//                 loginIcon,
//                 loginText,
//                 email(),
//                 password(),
//                 loginButton(),
//               ],
//             ),
//             /*Visibility(
//               child: errorAlert(),
//               visible: !isAuthenticationSuccess,
//             ),*/
//           ],
//         ),
//       ),
//     );
//   }
//
//   Row _backButton() {
//     return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//       SizedBox(width: 15),
//       IconButton(
//         icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
//         onPressed: () {
//           Navigator.pop(context);
//           //ModalRoute.of(context)?.canPop
//         },
//       ),
//     ]);
//   }
//
//   AlertDialog errorAlert() {
//     return AlertDialog(
//       title: Text(signInAlertTitle),
//       content: errorMessage.isEmpty
//           ? Text(errorMessage)
//           : CircularProgressIndicator(),
//     );
//   }
//
//   ButtonStyle loginButtonStyle() => ButtonStyle(
//         foregroundColor: loginButtonColor,
//         padding: loginButtonPadding,
//         shape: loginButtonShape,
//       );
//
//   TextButton loginButton() => TextButton(
//         onPressed: navigateToDashboard,
//         style: loginButtonStyle(),
//         child: const Text("Login"),
//       );
//
//   Future<bool> navigateToDashboard() async {
//     //isAuthenticationSuccess = false;
//     //isButtonPressed = true;
//     try {
//       print("Email to authenticate: " + emailController.text);
//       isAuthenticationSuccess = (await Authentication()
//           .signInWithEmail(emailController.text, passwordController.text));
//       if (isAuthenticationSuccess) {
//         //isButtonPressed = false;
//
//         Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(builder: (context) => Dashboard()),
//           (Route<dynamic> route) => false,
//         );
//         //isAuthenticationSuccess = false;
//       } else {
//         setState(() {
//           isAuthenticationSuccess = false;
//         });
//         /*signInAlertTitle = "Error signing in...";
//         print("Error signing in... " + errorMessage);*/
//       }
//     } on FirebaseAuthException catch (error) {
//       print("Error signing in... " + errorMessage);
//       if (error.code == 'ERROR_WRONG_PASSWORD') {
//         errorMessage = "check pass";
//         hintTextPassword = 'Password incorrect. Please try again';
//       }
//       // Alert(
//       //         context: context,
//       //         title: "Failed Login",
//       //         desc: "Incorrect Email Or Password.")
//       //     .show();
//       //Shows a message in case of error.
//     }
//     return isAuthenticationSuccess;
//   }
//
//   SizedBox email() {
//     return SizedBox(
//       width: 280,
//       child: TextField(
//         controller: emailController,
//         decoration: new InputDecoration(
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Purple, width: 4.0),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Purple, width: 3.0),
//           ),
//           hintText: 'Enter your email',
//           prefixIcon: Icon(
//             Icons.email,
//             color: Purple,
//           ),
//         ),
//       ),
//     );
//   }
//
//   SizedBox password() {
//     return SizedBox(
//       width: 280,
//       child: TextFormField(
//         obscureText: _isObscure,
//         controller: passwordController,
//         decoration: new InputDecoration(
//           errorText: isAuthenticationSuccess ? null : errorMessage,
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Purple, width: 4.0),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Purple, width: 3.0),
//           ),
//           hintText: hintTextPassword,
//           prefixIcon: Icon(
//             Icons.lock,
//             color: Purple,
//           ),
//           suffixIcon: iconObscure,
//         ),
//       ),
//     );
//   }
// }
