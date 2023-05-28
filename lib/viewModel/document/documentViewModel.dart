import 'dart:developer' as developer;

import 'package:go_router/go_router.dart';
import 'package:google_docs_clone/model/models/document/AllDocumentResponse.dart';
import 'package:google_docs_clone/model/models/document/createDocumentResponse.dart';
import 'package:google_docs_clone/model/models/user/getUserDataResponse.dart';
import 'package:google_docs_clone/model/service/document/createDocument.dart';
import 'package:google_docs_clone/model/service/document/getDocument.dart';
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class DocumentViewModel extends BaseModel {
  //
  CreateDocumentResponse? createDocumentResponse;
  GetUserDataResponse? getUserDataResponse;
  AllDocumentResponse? allDocumentResponse;

  //
  onCreateDocument(context) async {
    CancellationToken cancellationToken = CancellationToken();
    try {
      await LocalStorage.getString(tokenKey).then((token) async {
        await CreateDocument.createDocumentFunction(
                token: token!, cancellationToken: cancellationToken)
            .then((value) async {
          if (value is CreateDocumentResponse) {
            createDocumentResponse = value;
            notifyListeners();
            developer.log(
                "This is the value of: ${createDocumentResponse!.document!.sId.toString()}");
            // snackBarWidget(context, text: "Document successfully created");
            GoRouter.of(context).goNamed(documentPage, pathParameters: {
              'id': createDocumentResponse!.document!.sId.toString()
            });
          }
        });
      });
    } catch (e) {
      print(e.toString());
    }
  }

  onFetchAllDocument(context) async {
    CancellationToken cancellationToken = CancellationToken();
    try {
      await LocalStorage.getString(tokenKey).then((token) async {
        await GetAllDocument.getAllDocumentFunction(
                token: token!, cancellationToken: cancellationToken)
            .then((value) async {
          if (value is AllDocumentResponse) {
            print("the returned value is: $value");
            allDocumentResponse = value;
            notifyListeners();
          } else {
            print("the returned value is: $value");
          }
        });
      });
    } catch (e) {
      print("error message for fetchAllDocuments: ${e.toString()}");
    }
  }

  onUpdateDocument(context) async {}
}
