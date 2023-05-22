import 'dart:developer' as developer;

import 'package:google_docs_clone/model/service/authenticate/LoginError.dart';
import 'package:google_docs_clone/model/service/authenticate/login.dart';
import 'package:google_docs_clone/model/utilities/functions/googleSignInAuth.dart';
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class SignInViewModel extends BaseModel {
  final googleSignAuth = GoogleSignAuth(googleSignIn: GoogleSignIn());

  //?? TextEditing controller
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  //?? error boolean
  bool? emailAddressError;
  bool? passwordError;

  //?? FocusNode
  FocusNode passwordFocusNode = FocusNode();
  FocusNode emailAddressFocusNode = FocusNode();

  void cancel(BuildContext context) {
    cancellationToken.cancel();
    Navigator.pop(context);
    print("request cancelled");
  }

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
          .then((value) {
        if (value is LoginError) {
          developer.log(value.error!);
        }
      });
    } catch (e) {
      developer.log("Nothing responded");
      developer.log(e.toString());
    }
  }

  // login with email and password
  loginWithEmailAndPassword(context) async {
    if (emailAddressController.text.isEmpty) {
      emailAddressError = true;
      notifyListeners();
    } else if (emailAddressError == false) {
      if (validateEmailAddress
          .isValidEmail(emailAddressController.text.trim())) {
        emailAddressError = false;
        notifyListeners();
      } else {
        emailAddressError = true;
        notifyListeners();
      }
    } else if (!isValidPassword(loginPasswordController.text.trim())) {
      passwordError = true;
      passwordFocusNode.requestFocus();
      notifyListeners();
    } else {
      // create account
      try {
        cancellationToken = CancellationToken();
        notifyListeners();
        runFunctionForApi(context,
            functionToRunService: LoginUser.loginUser(
                cancellationToken: cancellationToken,
                email: emailAddressController.text.trim(),
                password: loginPasswordController.text.trim(),
                displayName: ''),

            // function to run after service
            functionToRunAfterService: (value) async {
          if (value is String
              // LoginResponse
              ) {
            Navigator.pop(context);
            await LocalStorage.setString("token", 'value.token!');
            // print(" This is token ==>   ${value.token}");

            await LocalStorage.setString("name", "value.lastName!");
            await LocalStorage.setString('accountIDString', "value.id!");
            Navigator.pushReplacementNamed(context, '/homePage');
          } else if (value is String

              // LoginError

              ) {
            Navigator.pop(context);
            loaderWithClose(context, text: ''
                // value.message!,
                );
            //print("error");
          }
          /* else if(value is String){
             Navigator.pop(context);
             loaderWithClose(context, text: 'Error! Unable to access host sever.',);
           }*/
        });
      } catch (e) {
        developer.log(e.toString());
      }
    }
  }
}
