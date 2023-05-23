import 'dart:developer' as developer;

import 'package:google_docs_clone/model/models/getUserDataResponse.dart';
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class GetUserData {
  static Future getUserData(
      {required String token,
      required CancellationToken cancellationToken}) async {
    Map<String, String> header = {"x-authorisation-token": token};

    //
    try {
      var response = HttpClientHelper.get(
        Uri.parse(baseUrl),
        cancelToken: cancellationToken,
        headers: header,
        timeRetry: const Duration(milliseconds: 100),
        retries: 3,
        timeLimit: const Duration(milliseconds: 10),
      ).then((Response? response) {
        var parsed = response!.body;
        developer.log("Data from GetUserData: $parsed");
        if (response.statusCode == 200) {
          developer.log("Check the status code");
          var decoded = jsonDecode(parsed);
          return GetUserDataResponse.fromMap(decoded);
        } else {
          return 'error';
        }
      });
      return response;
    } on OperationCanceledError catch (e) {
      print(e);
      developer.log(e.toString());
    }
  }
}
