import 'dart:developer' as developer;

import 'package:google_docs_clone/model/service/authenticate/login.dart';
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class SignInViewModel extends BaseModel {
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
