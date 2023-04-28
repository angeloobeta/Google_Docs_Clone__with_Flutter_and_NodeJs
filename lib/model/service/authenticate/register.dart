import 'dart:developer' as developer;

import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class NewUser {
  Future createAccountFunction(
      {required String name,
      required String email,
      required String profilePics,
      required CancellationToken,
      String? uid,
      String,
      token,
      cancellationToken}) async {
    Map<String, String> header = {
      "Content-Type": "application/json",
      "Charset": "UTF-8"
      // "x-api-key": "MonieTreeeKey"
    };
    var data = {
      "name": name,
      "email": email,
      "profilePics": profilePics,
      "uid": uid ?? ''
    };
    var url = baseUrl + registerUrl;
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
        var parsed = response!.body;

        if (response.statusCode == 200) {
          Map<String, dynamic> decoded = json.decode(parsed);
          developer.log("");
          developer.log('CreateAccountResponse i am decoded $decoded');
          return CreateAccountResponse.fromMap(decoded);
        } else {
          Map<String, dynamic> decoded = json.decode(parsed);
          developer.log("");
          developer.log('CreateAccountError i am decoded $decoded');
          return CreateAccountError.fromMap(decoded);
        }
      });
      return respond;
    } on OperationCanceledError catch (_) {}
  }
}
