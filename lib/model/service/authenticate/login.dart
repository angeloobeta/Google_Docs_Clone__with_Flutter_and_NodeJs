import 'dart:developer' as developer;

import 'package:google_docs_clone/model/models/loginResponse.dart';
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
      'Content-Type': 'application/json',
      // 'Content-Type': "application/json"

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
      "name": "Castel Okorie",
      "email": "kiopks@gmail.com",
      "profilePicture": "https://cloundinaryImage/#bshh22710r"
    };
    var url = registerUrl;
    var body = jsonEncode(data);
    // + "loginUserUrl";

    try {
      var respond = await HttpClientHelper.post(
        Uri.parse(url),
        headers: header,
        body: body,
        // body: data,
        cancelToken: cancellationToken,
        timeRetry: const Duration(milliseconds: 100),
        retries: 3,
        timeLimit: const Duration(seconds: 10),
      ).then((Response? response) {
        var parsed = response?.body;
        debugPrint("This is parsed: $parsed");
        if (response!.statusCode == 200) {
          print("We got status 200");
          var decoded = json.decode(parsed!);

          if (LoginResponse.fromMap(decoded).user!.Id!.isEmpty) {
            return 'error';
          } else {
            return LoginResponse.fromMap(decoded);
          }
        } else {
          var decoded = json.decode(parsed!);
          if (decoded is Map || LoginError.fromMap(decoded).error!.isNotEmpty) {
            // return decoded;
            developer
                .log("check this out: ${LoginError.fromMap(decoded).error!}");
            return LoginError.fromMap(decoded);
          } else {
            developer
                .log("This was printed inside login network else ===========");
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
