import '../model/utilities/imports/generalImport.dart';

class SplashScreenViewModel extends BaseModel {
  // splash screen image
  Widget image = Row(
    children: [
      Image.asset(
        'assets/images/docs-logo.png',
        key: const ValueKey('firstImage'),
      ),
      S(w: 150)
    ],
  );

  future(context) async {
    await Future.delayed(const Duration(seconds: 3), () async {
      String? userToken = await LocalStorage.getString(tokenKey);
      if (userToken == null || userToken == "token") {
        Navigator.popAndPushNamed(context, signIn);
      } else {
        Navigator.pushReplacementNamed(context, homePage);
      }
    });
  }
}
