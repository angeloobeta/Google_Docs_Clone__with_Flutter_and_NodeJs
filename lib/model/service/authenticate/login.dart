import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class LoginUser {
  // function to login user
  static Future loginUser(
      {required String phoneOrEmail,
      required String password,
      required String baseUrl,
      required CancellationToken cancellationToken}) async {
    Map<String, String> header = {
      'Accept': "application/json",
      "x-api-key": "MonieTreeeKey"
    };
    String splitString;
    if (int.tryParse(phoneOrEmail) != null) {
      splitString = phoneOrEmail.substring(1);
      print("The email address ${splitString}");
    }
    var data = {
      "email_or_phone_number": int.tryParse(phoneOrEmail) != null
          ? "+234${phoneOrEmail.substring(1)}"
          : phoneOrEmail,
      "password": password
    };
    var url = baseUrl + "loginUserUrl";
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
        debugPrint(response.toString());
        var parsed = response!.body;
        debugPrint(parsed);
        if (response.statusCode == 200) {
          var decoded = json.decode(parsed);

          if (true
              // LoginResponse.fromMap(decoded).id!.isEmpty

              ) {
            return 'error';
          } else {
            // return LoginResponse.fromMap(decoded);
          }
        } else {
          var decoded = json.decode(parsed);
          if (decoded is Map || true
              // LoginError.fromMap(decoded).message!.isNotEmpty

              ) {
            return "";
            // LoginError.fromMap(decoded);
          } else {
            debugPrint(parsed);
            return 'error';
          }
        }
      });

      return respond;
    } on OperationCanceledError catch (e) {
      print(e);
    }
  }
}
