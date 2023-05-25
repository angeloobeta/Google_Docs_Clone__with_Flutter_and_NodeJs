import 'dart:core';
import 'dart:developer' as developer;

import 'package:google_docs_clone/model/models/document/createDocumentResponse.dart';
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class CreateDocument {
  static Future createDocumentFunction({
    required String token,
    required CancellationToken cancellationToken,
    String? uid,
  }) async {
    Map<String, String> header = {
      'Accept': "application/json",
      "x-authorisation-token": token
    };

    var data = jsonEncode({
      "createAt": DateTime.now().millisecondsSinceEpoch,
      // "title": "Untitled",
      // "Content": "",
      // "uid": uid ?? ''
    });

    var url = createDocument;
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
          developer.log('CreateDocumentResponse i am decoded $decoded');
          return CreateDocumentResponse.fromJson(decoded);
        } else {
          Map<String, dynamic> decoded = json.decode(parsed);
          developer.log("");
          developer.log('CreateDocumentErrorResponse i am decoded $decoded');
          return CreateAccountErrorResponse.fromJson(decoded);
        }
      });
      return respond;
    } on OperationCanceledError catch (_) {}
  }
}
