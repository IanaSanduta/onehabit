import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  User? user;
  String? authError;
  late bool isSignedIn;
  late Future<Map<bool, String>> authenticationReturn;

  void checkLogin() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  Future<bool> signInWithEmail(String email, String password) async {
    //bool isSignedIn = true;
    try {
      final userAuthentication = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      isSignedIn = true;
      user = userAuthentication.user;
      print("logged in: " + user!.email.toString());
    } on FirebaseAuthException catch (error) {
      print("Error " + error.code);
      isSignedIn = false;
    }

    return isSignedIn;
  }
}
