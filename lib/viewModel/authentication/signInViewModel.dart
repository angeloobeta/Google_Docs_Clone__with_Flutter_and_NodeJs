import 'package:google_docs_clone/model/utilities/functions/googleSignInAuth.dart';
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class SignInViewModel extends BaseModel {
  final googleSignAuth = GoogleSignAuth(googleSignIn: GoogleSignIn());

  // sign with google
  onSignInWithGoogle(context) {
    googleSignAuth.signInWithGoogle();
  }

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
    cancellationToken?.cancel();
    Navigator.pop(context);
    print("request cancelled");
  }

  // loginUserAccount(context) async {
  //   if (emailAddressController.text.isEmpty) {
  //     emailAddressError = true;
  //     notifyListeners();
  //   } else if (emailAddressError == false) {
  //     if (validateEmailAddress
  //         .isValidEmail(emailAddressController.text.trim())) {
  //       emailAddressError = false;
  //       notifyListeners();
  //     } else {
  //       emailAddressError = true;
  //       notifyListeners();
  //     }
  //   } else if (!isValidPassword(loginPasswordController.text.trim())) {
  //     passwordError = true;
  //     passwordFocusNode.requestFocus();
  //     notifyListeners();
  //   } else {
  //     // create account
  //     try {
  //       cancellationToken = CancellationToken();
  //       notifyListeners();
  //       // load baseUrl
  //       loadBaseurl().then((value) async {
  //         loadingDialog(context,
  //             text: "Kindly hold on, while we check for your account",
  //             onWillPop: () {
  //           return cancel(context);
  //         });
  //         await LoginUser.loginUser(
  //                 cancellationToken: cancellationToken!,
  //                 baseUrl: baseUrl,
  //                 phoneOrEmail: loginPhoneController.text.trim(),
  //                 password: loginPasswordController.text.trim())
  //             .then((value) async {
  //           if (value is LoginResponse) {
  //             Navigator.pop(context);
  //             await localStorage.setString(token, value.token!);
  //             print(" This is token ==>   ${value.token}");
  //
  //             await localStorage.setString(name, value.lastName!);
  //             await localStorage.setString(accountIDString, value.id!);
  //             Navigator.pushReplacementNamed(context, '/homePage');
  //           } else if (value is LoginError) {
  //             Navigator.pop(context);
  //             loaderWithClose(
  //               context,
  //               text: value.message!,
  //             );
  //             //print("error");
  //           }
  //           /* else if(value is String){
  //            Navigator.pop(context);
  //            loaderWithClose(context, text: 'Error! Unable to access host sever.',);
  //          }*/
  //         }).catchError((errorValue, stackTrace) {
  //           print('i am error value $errorValue');
  //           print(stackTrace);
  //           if (errorValue is SocketException) {
  //             Navigator.pop(context);
  //             loaderWithClose(
  //               context,
  //               text:
  //                   "Unable to complete request, kindly check your internet connection and try again",
  //             );
  //           }
  //           if (errorValue is FormatException) {
  //             loaderWithClose(context, text: errorValue.toString(), onTap: () {
  //               Navigator.pop(context);
  //               Navigator.pop(context);
  //             });
  //           } else if (errorValue is SocketException) {
  //             Navigator.pop(context);
  //             loaderWithClose(
  //               context,
  //               text:
  //                   "Unable to complete request, kindly check your internet connection and try again",
  //             );
  //           } else if (errorValue
  //               .toString()
  //               .contains("Null check operator used on a null value")) {
  //             loaderWithClose(context,
  //                 text:
  //                     'Ensure your internet connection is on and your base url is correct',
  //                 onTap: () {
  //               Navigator.pop(context);
  //               Navigator.pop(context);
  //             });
  //           } else if (errorValue.toString().contains(
  //                   'Invalid argument(s): No host specified in URI') ||
  //               errorValue.toString().contains('No host specified in URI') ||
  //               errorValue
  //                   .toString()
  //                   .contains(" The error handler of Future.catchError")) {
  //             loaderWithClose(context, text: 'Invalid base url', onTap: () {
  //               Navigator.pop(context);
  //               Navigator.pop(context);
  //             });
  //           }
  //         });
  //         ;
  //       });
  //     } catch (errorValue) {
  //       if (errorValue is SocketException) {
  //         Navigator.pop(context);
  //         loaderWithClose(
  //           context,
  //           text:
  //               "Unable to complete request, kindly check your internet connection and try again",
  //         );
  //       } else if (errorValue
  //               .toString()
  //               .contains('Invalid argument(s): No host specified in URI') ||
  //           errorValue.toString().contains('No host specified in URI')) {
  //         print(errorValue);
  //         loaderWithClose(context, text: 'Invalid base url', onTap: () {
  //           Navigator.pop(context);
  //           Navigator.pop(context);
  //         });
  //       }
  //     }
  //   }
  // }
}
