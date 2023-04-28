import 'dart:developer' as developer;

import 'package:google_docs_clone/model/models/createAccountResponse.dart';
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class CreateAccountViewModel extends BaseModel {
//? text fields
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  //? error booleans
  bool passwordError = false;
  bool emailError = false;
  bool nameError = false;

  // ? focus Nodes
  FocusNode passwordFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();

  // ? function and parameters for obscure text
  bool showText = true;

  showTextFunction() {
    showText = !showText;
    notifyListeners();
  }

  // valid email as user types in, using the unchanged value from the
  // generalTextField
  onChangedFunctionEmail() {
    emailFocusNode.addListener(() {
      if (emailFocusNode.hasFocus == false) {
        emailError = false;
        notifyListeners();
      }
    });
    if (validateEmailAddress.isValidEmail(emailController.text.trim())) {
      emailError = false;
      notifyListeners();
    } else {
      emailError = true;
      notifyListeners();
    }
  }

  // onChanged function for name
  onChangedFunctionName() {
    nameFocusNode.addListener(() {
      if (nameFocusNode.hasFocus == false) {
        nameError = false;
        notifyListeners();
      }
    });
    if (nameController.text.length <= 2) {
      developer.log('there is error in length of name');
      nameError = true;
      notifyListeners();
    } else {
      print('there is no error with the length of name');
      nameError = false;
      notifyListeners();
    }
  }

  // onChanged function for password entry
  onChangedFunctionPassword() {
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus == false) {
        passwordError = false;
        notifyListeners();
      }
    });
    if (isValidPassword(passwordController.text.trim())) {
      passwordError = false;
      notifyListeners();
    } else {
      passwordError = true;
      notifyListeners();
    }
  }

  // create user account
  createUserAccount(context) async {
    if (nameController.text.length <= 2) {
      print('there is error in length of name');
      nameError = true;
      nameFocusNode.requestFocus();
      notifyListeners();
    } else if (!validateEmailAddress
        .isValidEmail(emailController.text.trim())) {
      emailError = true;
      emailFocusNode.requestFocus();
      notifyListeners();
    } else if (!isValidPassword(passwordController.text.trim())) {
      passwordError = true;
      passwordFocusNode.requestFocus();
      notifyListeners();
    } else {
      cancellationToken = CancellationToken();
      notifyListeners();
      // load baseUrl
      loadBaseurl().then((value) async {
        loadingDialog(context,
            text: "Kindly hold on, we are Setting up your account",
            onWillPop: () {
          return cancel(context);
        });
        await newUser
            .createAccountFunction(
                cancellationToken: cancellationToken!,
                baseUrl: baseUrl,
                name: nameController.text.trim(),
                phone: phoneController.text.trim(),
                password: passwordController.text.trim(),
                email: emailController.text.trim())
            .then((value) async {
          if (value is CreateAccountResponse) {
            SchedulerBinding.instance?.addPostFrameCallback(
              (_) => showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => Center(
                  child: S(
                    h: 200,
                    w: 200,
                    child: customDialog(
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GeneralIconDisplay(FontAwesomeIcons.circleCheck,
                                green, UniqueKey(), 50),
                            S(h: 20),
                            GeneralTextDisplay(
                              "${nameController.text} Welcome to Google Docs, Your account has been created successfully",
                              white,
                              3,
                              14,
                              FontWeight.w500,
                              "",
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        align: Alignment.center),
                  ),
                ),
              ),
            );
            // save token to storage
            await localStorage.setString(token, value.token!).then((_) async {
              //print(value);
              await Future.delayed(const Duration(seconds: 3), () async {
                Navigator.pop(context);
                // save page state
                await localStorage.setString(appStatus, verificationPage);
                Navigator.pushReplacementNamed(context, '/verifyCode',
                    arguments: value.token);
                // Navigator.pushReplacementNamed(context, '/signIn',
                //     arguments: value.token);
              });
            });
          } else if (value is CreateAccountError) {
            Navigator.pop(context);
            loaderWithClose(context,
                text: value.message!
                        .contains("Unknown data integrity issue with resource")
                    ? "Phone number or email address already exist in the database"
                    : value.message!);
            // SchedulerBinding.instance?.addPostFrameCallback(
            //   (_) => showDialog(
            //     barrierDismissible: false,
            //     context: context,
            //     builder: (context) => Center(
            //       child: S(
            //         h: 220,
            //         w: 220,
            //         child: customDialog(
            //             Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 GeneralIconDisplay(
            //                     Icons.error, error, UniqueKey(), 50),
            //                 S(h: 20),
            //                 GeneralTextDisplay(
            //                   value.message!.contains(
            //                           "Unknown data integrity issue with resource")
            //                       ? "Phone number or email address already exist in the database"
            //                       : value.message!,
            //                   white,
            //                   3,
            //                   14,
            //                   FontWeight.w500,
            //                   "",
            //                   textAlign: TextAlign.center,
            //                 ),
            //                 S(h: 15),
            //                 Row(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     GestureDetector(
            //                       onTap: () {
            //                         Navigator.pop(context);
            //                       },
            //                       child: const GeneralTextDisplay(
            //                         "close",
            //                         green,
            //                         3,
            //                         14,
            //                         FontWeight.w400,
            //                         "",
            //                       ),
            //                     ),
            //                   ],
            //                 )
            //               ],
            //             ),
            //             align: Alignment.center),
            //       ),
            //     ),
            //   ),
            // );
          }
        }).catchError((errorValue) {
          if (errorValue is SocketException) {
            Navigator.pop(context);
            loaderWithClose(
              context,
              text:
                  "Unable to complete request, kindly check your internet connection and try again",
            );
          } else if (errorValue
                  .toString()
                  .contains('Invalid argument(s): No host specified in URI') ||
              errorValue.toString().contains('No host specified in URI') ||
              errorValue
                  .toString()
                  .contains("Null check operator used on a null value") ||
              errorValue
                  .toString()
                  .contains(" The error handler of Future.catchError")) {
            Navigator.pop(context);
            loaderWithClose(context, text: 'Invalid base url');
          }
        });
      });
      // create account
      try {} on SocketException catch (_) {
        Navigator.pop(context);
        loaderWithClose(
          context,
          text:
              "Unable to complete request, kindly check your internet connection and try again",
        );
      }
    }

    // go to new page, with success,

    // return error dialog on error
  }
}
// await localStorage.setString(resetCode, verificationPage);
