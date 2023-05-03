import 'dart:core';
import 'dart:developer' as developer;

import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class GetDocumentById {
  static Future getDocumentByIdFunction({
    required String token,
    required String id,
    required CancellationToken cancellationToken,
  }) async {
    Map<String, String> header = {
      'Accept': "application/json",
      "x-auth-key": token,
      "Authorisation": "GoogleCloneKey",
    };

    var data = {"UpdatedAt": DateTime.now().millisecondsSinceEpoch, "id": id};
    var url = "$baseUrl/docs/$id";
    try {
      var respond = HttpClientHelper.get(
        Uri.parse(url),
        headers: header,
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
          return CreateAccountResponse.fromJson(decoded);
        } else {
          Map<String, dynamic> decoded = json.decode(parsed);
          developer.log("");
          developer.log('CreateAccountError i am decoded $decoded');
          return CreateAccountErrorResponse.fromJson(decoded);
        }
      });
      return respond;
    } on OperationCanceledError catch (_) {}
  }
}
