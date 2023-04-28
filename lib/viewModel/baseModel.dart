import 'dart:developer' as developer;

import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class BaseModel extends ChangeNotifier {
  final GoogleSignIn _googleSignIn;
  final NewUser newUser;

  BaseModel(this.newUser, {required GoogleSignIn googleSignIn})
      : _googleSignIn = googleSignIn;

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

        // final userAcc = UserModel(
        //     profilePics: user.photoUrl,
        //     name: user.displayName!,
        //     email: user.email,
        //     uuid: '',
        //     token: '');
      }
      // send request to register user
      await newUser.createAccountFunction(
          name: user!.displayName!,
          email: user.email,
          profilePics: user.photoUrl!,
          cancellationToken: cancellationToken);
    } catch (e) {
      developer.log(e.toString());
    }
  }
}
