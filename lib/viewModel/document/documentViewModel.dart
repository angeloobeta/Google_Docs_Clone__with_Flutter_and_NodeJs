import 'dart:developer' as developer;

import 'package:go_router/go_router.dart';
import 'package:google_docs_clone/model/models/document/createDocumentResponse.dart';
import 'package:google_docs_clone/model/models/document/fetchAllDocumentResponse.dart';
import 'package:google_docs_clone/model/models/user/getUserDataResponse.dart';
import 'package:google_docs_clone/model/service/document/createDocument.dart';
import 'package:google_docs_clone/model/service/document/getAllDocument.dart';
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class DocumentViewModel extends BaseModel {
  //
  CreateDocumentResponse? createDocumentResponse;
  GetUserDataResponse? getUserDataResponse;
  FetchAllDocumentResponse? fetchAllDocumentResponse;

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
          if (value is FetchAllDocumentResponse) {
            fetchAllDocumentResponse = value;
            notifyListeners();
            print(
                "the returned value is: ${fetchAllDocumentResponse?.documents![0].title}");
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
