import 'dart:developer' as developer;

import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignAuth {
  final GoogleSignIn? _googleSignIn;

  GoogleSignAuth({required googleSignIn}) : _googleSignIn = googleSignIn;

  // signIn with google
  void signInWithGoogle() async {
    try {
      final user = await _googleSignIn!.signIn();
      if (user != null) {
        developer.log(user.id);
        developer.log(user.email);
        developer.log(user.displayName!);
        developer.log(user.photoUrl!);
      } else {
        developer.log("Nothing responded");
      }
    } catch (e) {
      developer.log(e.toString());
    }
  }
}