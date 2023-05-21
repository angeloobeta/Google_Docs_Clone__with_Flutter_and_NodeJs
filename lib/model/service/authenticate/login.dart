import 'dart:developer' as developer;

import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class LoginUser {
  // function to login user
  static Future loginUser(
      {required String email,
      String? displayName,
      String? password,
      String? uuid,
      String? token,
      required CancellationToken cancellationToken}) async {
    Map<String, String> header = {
      // 'Accept': "application/json",
      'Content-Type': "application/json"

      // "x-api-key": "x-auth-token"
    };
    String splitString;
    // if (int.tryParse(phoneOrEmail) != null) {
    //   splitString = phoneOrEmail.substring(1);
    //   print("The email address ${splitString}");
    // }
    // var data = {
    //   "email_or_phone_number": int.tryParse(phoneOrEmail) != null
    //       ? "+234${phoneOrEmail.substring(1)}"
    //       : phoneOrEmail,
    //   "password": password
    // };

    // var data = {
    //   "email": email,
    //   "name": displayName,
    //   "profilePicture": 'https://cloundinaryImage/#bshh22710r'
    // };

    var data = {
      'name': "Castel Okorie",
      'email': "castel@gmail.com",
      'profilePicture': "https://cloundinaryImage/#bshh22710r"
    };
    var url = registerUrl;
    // + "loginUserUrl";
    try {
      var respond = HttpClientHelper.post(
        Uri.parse(url),
        headers: header,
        body: data,
        cancelToken: cancellationToken,
        timeRetry: const Duration(milliseconds: 100),
        retries: 3,
        timeLimit: const Duration(seconds: 10),
      ).then((Response? response) {
        var parsed = response?.body;
        debugPrint(parsed);
        if (response!.statusCode == 200) {
          print("We got status 200");
          var decoded = json.decode(parsed!);

          if (true
              // LoginResponse.fromMap(decoded).id!.isEmpty

              ) {
            return 'error';
          } else {
            // return LoginResponse.fromMap(decoded);
          }
        } else {
          var decoded = json.decode(parsed!);
          if (decoded is Map || true
              // LoginError.fromMap(decoded).message!.isNotEmpty

              ) {
            developer.log("This was printed");
            return decoded;
            // LoginError.fromMap(decoded);
          } else {
            developer.log("This was printed ===========");
            debugPrint(parsed);
            return 'error';
          }
        }
      });

      return respond;
    } on OperationCanceledError catch (e) {
      print(e);
      developer.log(e.toString());
    }
  }
}
