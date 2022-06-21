import 'package:firebase_auth/firebase_auth.dart';

class RegistrationModel {
  Future<bool> registerWithEmail(
      String name, String email, String password) async {
    bool isSuccess = false;

    final userRegistration = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    return isSuccess;
  }
}
