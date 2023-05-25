import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignAuth {
  final GoogleSignIn? _googleSignIn;

  GoogleSignAuth({required googleSignIn}) : _googleSignIn = googleSignIn;

  get googleSignIn => _googleSignIn?.signIn();
  get googleSignOut => _googleSignIn?.signOut();
}
