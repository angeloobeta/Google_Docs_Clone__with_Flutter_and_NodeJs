import 'dart:developer' as developer;

import 'package:go_router/go_router.dart';
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class SplashScreenViewModel extends BaseModel {
  // splash screen image
  Widget image = Row(
    children: [
      Image.asset(
        'assets/images/docs-logo.png',
        key: const ValueKey('firstImage'),
        height: 150,
        width: 150,
      ),
    ],
  );

  future(context) async {
    await Future.delayed(const Duration(seconds: 3), () async {
      String? userToken = await LocalStorage.getString(tokenKey);
      if (userToken == null || userToken == "token" || userToken == "") {
        developer.log("There is not token currently");
        // Navigator.popAndPushNamed(context, signIn);
        GoRouter.of(context).pushReplacement(signIn);
      } else {
        // developer.log("This is the token: $userToken");
        GoRouter.of(context).pushReplacement(homePage);
        // Navigator.pushReplacementNamed(context, homePage);
      }
    });
  }
}
