import 'dart:core';

import 'package:google_docs_clone/model/models/document/fetchAllDocumentResponse.dart';
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class GetAllDocument {
  // function to get user account details
  static Future getAllDocumentFunction(
      {required String token,
      required CancellationToken cancellationToken}) async {
    Map<String, String> header = {"x-authorisation-token": token};
    try {
      //
      var respond =
          get(Uri.parse(getAllDocumentUrl), headers: header).then((response) {
        // print(response.body);

        if (response.statusCode == 200) {
          var parsed = json.decode(response.body);
          // print("This is parsed from all documents \n $parsed");
          return FetchAllDocumentResponse.fromJson(parsed);
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
