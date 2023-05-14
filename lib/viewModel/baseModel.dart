import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class BaseModel extends ChangeNotifier {
  //?? cancellation Token
  CancellationToken cancellationToken = CancellationToken();

  // BaseModel({required GoogleSignIn googleSignIn})
  //     : _googleSignIn = googleSignIn;

  // void signInWithGoogle() async {
  //   try {
  //     final user = await _googleSignIn?.signIn();
  //     if (user != null) {
  //       // log files
  //       developer.log(user.id);
  //       developer.log(user.email);
  //       developer.log(user.displayName!);
  //       developer.log(user.photoUrl!);
  //       developer.log(user.serverAuthCode!);
  //
  //       // final userAcc = UserModel(
  //       //     profilePics: user.photoUrl,
  //       //     name: user.displayName!,
  //       //     email: user.email,
  //       //     uuid: '',
  //       //     token: '');
  //
  //       // save user data to database
  //       await NewUser.createAccountFunction(
  //           name: user.displayName!,
  //           email: user.email,
  //           profilePics: user.photoUrl!,
  //           cancellationToken: cancellationToken);
  //     }
  //     // send request to register user
  //   } catch (e) {
  //     developer.log(e.toString());
  //   }
  // }
}
