import 'package:go_router/go_router.dart';
import 'package:google_docs_clone/model/models/document/createDocumentResponse.dart';
import 'package:google_docs_clone/model/models/user/getUserDataResponse.dart';
import 'package:google_docs_clone/model/service/document/createDocument.dart';
import 'package:google_docs_clone/model/service/document/getDocument.dart';
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class DocumentViewModel extends BaseModel {
  //
  CreateDocumentResponse? createDocumentResponse;
  GetUserDataResponse? getUserDataResponse;

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
            // snackBarWidget(context, text: "Document successfully created");
            GoRouter.of(context).goNamed(documentPage, pathParameters: {
              'id': createDocumentResponse!.document!.sId.toString()
            });
            print("Hello");
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
        await GetDocument.getDocumentFunction(
                token: token!, cancellationToken: cancellationToken)
            .then((value) async {
          if (value is GetUserDataResponse) {
            getUserDataResponse = value;
            snackBarWidget(context, text: "Document successfully created");
            GoRouter.of(context).goNamed(documentPage, pathParameters: {
              'id': createDocumentResponse!.document!.sId.toString()
            });
            return getUserDataResponse;
          }
        });
      });
    } catch (e) {}
  }

  onUpdateDocument(context) async {}
}
