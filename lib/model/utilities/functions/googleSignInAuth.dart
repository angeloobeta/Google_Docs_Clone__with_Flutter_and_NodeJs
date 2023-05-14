import 'dart:developer' as developer;

import 'package:google_docs_clone/model/service/authenticate/login.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignAuth {
  final GoogleSignIn? _googleSignIn;

  GoogleSignAuth({required googleSignIn}) : _googleSignIn = googleSignIn;

  // signIn with google
  void signInWithGoogle() async {
    try {
      final user = await _googleSignIn!.signIn();
      if (user != null) {
        LoginUser.loginUser(phoneOrEmail: user.email, password: "password", baseUrl: "baseUrl", cancellationToken: "cancellationToken")
        // call the method to send to the server side
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
