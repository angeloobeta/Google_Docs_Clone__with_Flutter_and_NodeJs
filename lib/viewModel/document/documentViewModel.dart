import 'dart:developer' as developer;

import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:go_router/go_router.dart';
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class DocumentViewModel extends BaseModel {
  // document title text controller
  TextEditingController documentTitleEditingController = TextEditingController(
      text: processLongString(
          minimumStringLength: 8,
          unProcessedString: "Untitled Document",
          substringLength: 14));

  // document text editing controller
  TextEditingController? documentTextEditingController;

  // Quill controller
  final quill.QuillController quillController = quill.QuillController.basic();

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
            // update the list of document on creating a new document
            onFetchAllDocument(context);
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

  onUpdateDocumentTitle(context) async {}
}
