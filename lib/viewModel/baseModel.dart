import 'dart:developer' as developer;

import 'package:google_docs_clone/model/models/getUserDataResponse.dart';
import 'package:google_docs_clone/model/models/loginResponse.dart';
import 'package:google_docs_clone/model/service/authenticate/getUserData.dart';
import 'package:google_docs_clone/model/service/authenticate/login.dart';
import 'package:google_docs_clone/model/utilities/functions/googleSignInAuth.dart';
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';
import 'package:routemaster/routemaster.dart';

class BaseModel extends ChangeNotifier {
  // google sign
  final googleSignAuth = GoogleSignAuth(googleSignIn: GoogleSignIn());
  //?? cancellation Token
  CancellationToken cancellationToken = CancellationToken();

  LoginResponse? loginResponse;
  GetUserDataResponse? getUserDataResponse;
  //
  // sign with google
  onSignInWithGoogle(context) async {
    try {
      // final user = await googleSignAuth.googleSign;
      // user gmail details
      // developer.log(user.id);
      // developer.log(user.email);
      // developer.log(user.displayName!);
      // developer.log(user.photoUrl!);

      // run function
      await LoginUser.loginUser(
              email: "nkechiruth@gmail.com",
              // user.email,
              displayName: "who is your guy",
              // user.displayName,
              cancellationToken: cancellationToken)
          .then((value) async {
        if (value is LoginError) {
          developer.log(value.error!);
          snackBarWidget(context, text: value.error!);
        }
        if (value is LoginResponse) {
          loginResponse = value;
          notifyListeners();
          // await LocalStorage.setString(tokenKey, loginResponse!.token!);
          await LocalStorage.setString(tokenKey, "");
          developer.log("token:   ${loginResponse!.token!}");
          // Navigator.pushReplacementNamed(context, homePage);
          Routemaster.of(context).replace(homePage);
        }
      });
    } catch (e) {
      developer.log("Nothing responded");
      snackBarWidget(context, text: networkError);
      developer.log(e.toString());
    }
  }

  // get user data after sign in
  onGetUserData(context) async {
    try {
      await LocalStorage.getString(tokenKey).then((token) async {
        // run function
        await GetUserData.getUserData(
                cancellationToken: cancellationToken, token: token!)
            .then((value) async {
          if (value is LoginError) {
            developer.log(value.error!);
            snackBarWidget(context, text: value.error!);
          }
          if (value is GetUserDataResponse) {
            getUserDataResponse = value;
            notifyListeners();
            await LocalStorage.setString(tokenKey, getUserDataResponse!.token!);
            // developer.log("token:   ${getUserDataResponse!.token!}");
          }
        });
      });
    } catch (e) {
      developer.log("Nothing responded for GetUserData");
      snackBarWidget(context, text: networkError);
      developer.log(e.toString());
    }
  }

  onSignOut(context) async {
    await LocalStorage.setString(tokenKey, "");
    await googleSignAuth.googleSignOut;
    Navigator.pushReplacementNamed(context, signIn);
  }
}
