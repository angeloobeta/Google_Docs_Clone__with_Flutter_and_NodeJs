import 'dart:developer' as developer;

import 'package:go_router/go_router.dart';
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class BaseModel extends ChangeNotifier {
  // google sign
  final googleSignAuth = GoogleSignAuth(googleSignIn: GoogleSignIn());
  CancellationToken cancellationToken = CancellationToken();

  GetUserDataResponse? getUserDataResponse;

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
        if (value is GetUserDataResponseError) {
          developer.log(value.error!);
          snackBarWidget(context, text: value.error!);
        }
        if (value is GetUserDataResponse) {
          getUserDataResponse = value;
          notifyListeners();
          await LocalStorage.setString(tokenKey, getUserDataResponse!.token!);
          developer.log("token:   ${getUserDataResponse!.token!}");
          GoRouter.of(context).pushReplacementNamed(homePage);
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
        await FetchUserData.fetchUserData(token: token!).then((value) async {
          if (value is GetUserDataResponseError) {
            developer.log("This is the error: ${value.error!}");
            snackBarWidget(context, text: value.error!);
          }
          if (value is GetUserDataResponse) {
            getUserDataResponse = value;
            notifyListeners();
            await LocalStorage.setString(tokenKey, getUserDataResponse!.token!);
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
    GoRouter.of(context).pushReplacementNamed(signIn);
  }
}
