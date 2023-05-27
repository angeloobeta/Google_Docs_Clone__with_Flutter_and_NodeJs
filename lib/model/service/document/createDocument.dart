import 'dart:core';

import 'package:google_docs_clone/model/models/document/createDocumentResponse.dart';
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class CreateDocument {
  // function to get user account details
  static Future createDocumentFunction(
      {required String token,
      required CancellationToken cancellationToken}) async {
    Map<String, String> header = {
      "Content-Type": "application/json",
      "x-authorisation-token": token
    };

    var data = jsonEncode({
      "createAt": DateTime.now().millisecondsSinceEpoch,
    });

    try {
      //
      var respond = post(Uri.parse(createDocument), headers: header, body: data)
          .then((response) {
        print(response.body);

        if (response.statusCode == 200) {
          var parsed = json.decode(response.body);
          return CreateDocumentResponse.fromJson(parsed);
        } else {
          return "error";
        }
      });
      return respond;
    } on OperationCanceledError catch (e) {
      debugPrint(e.stackTrace.toString());
      debugPrint(e.msg.toString());
    }
  }
}
