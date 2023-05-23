import 'dart:developer' as developer;

import '../model/utilities/imports/generalImport.dart';

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
        Navigator.popAndPushNamed(context, signIn);
        // Routemaster.of(context).replace(signIn);
      } else {
        // developer.log("This is the token: $userToken");
        // Routemaster.of(context).replace(homePage);
        Navigator.pushReplacementNamed(context, homePage);
        // Navigator.popAndPushNamed(context, signIn);
      }
    });
  }
}
