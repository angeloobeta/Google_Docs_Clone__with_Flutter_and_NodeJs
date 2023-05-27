import 'dart:core';

import 'package:google_docs_clone/model/models/user/getUserDataResponse.dart';
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class GetDocument {
  // function to get user account details
  static Future getDocumentFunction(
      {required String token,
      required CancellationToken cancellationToken}) async {
    Map<String, String> header = {"x-authorisation-token": token};
    try {
      //
      var respond =
          get(Uri.parse(getDocuments), headers: header).then((response) {
        print(response.body);

        if (response.statusCode == 200) {
          var parsed = response.body;
          List<GetUserDataResponse> listOfDocuments = [];
          for (int i = 0; i < jsonDecode(parsed).length; i++) {
            listOfDocuments
                .add(GetUserDataResponse.fromMap(json.decode(parsed)[i]));
          }
          return listOfDocuments;
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
