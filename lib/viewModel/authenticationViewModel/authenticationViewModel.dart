import 'dart:developer' as developer;

import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class AuthenticationRepository extends BaseModel {
  final GoogleSignIn _googleSignIn;
  final Client _client;

  AuthenticationRepository(
      {required GoogleSignIn googleSignIn, required Client client})
      : _googleSignIn = googleSignIn,
        _client = client;

  void signInWithGoogle() async {
    try {
      final user = await _googleSignIn.signIn();
      if (user != null) {
        // log files
        developer.log(user.id);
        developer.log(user.email);
        developer.log(user.displayName!);
        developer.log(user.photoUrl!);
        developer.log(user.serverAuthCode!);

        final userAcc = UserModel(
            profilePics: user.photoUrl!,
            name: user.displayName!,
            email: user.email,
            uuid: '',
            token: '');
      }
      
      _client.post(url)
    } catch (e) {
      developer.log(e.toString());
    }
  }
}
