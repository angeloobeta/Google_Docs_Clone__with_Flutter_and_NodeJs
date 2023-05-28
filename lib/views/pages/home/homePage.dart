import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';
import 'package:google_docs_clone/viewModel/document/documentViewModel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DocumentViewModel>.reactive(
      onViewModelReady: (model) {
        model.onGetUserData(context);
        model.onFetchAllDocument(context);
      },
      viewModelBuilder: () => DocumentViewModel(),
      builder: (context, model, child) => BaseUi(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: white,
          actions: [
            IconButton(
              onPressed: () => model.onCreateDocument(context),
              icon: const Icon(
                Icons.add,
                color: black,
              ),
            ),
            IconButton(
              onPressed: () async {
                model.onSignOut(context);
              },
              icon: const Icon(Icons.logout, color: red),
            )
          ],
        ),
        safeTop: true,
        children: [
          AdaptivePositioned(
              left: 20,
              GeneralTextDisplay(
                  model.getUserDataResponse?.user != null
                      ? model.getUserDataResponse!.user!.email!
                      : "Refreshing",
                  grey,
                  1,
                  12,
                  FontWeight.normal,
                  "")),
          AdaptivePositioned(
            left: 20,
            S(
              child: ListView.builder(
                  itemCount: model.allDocumentResponse != null
                      ? model.getUserDataResponse!.user!.sId!.length
                      : 0,
                  itemBuilder: (context, index) {
                    return const Card(
                      // child: Text(model.allDocumentResponse!.title![index]),
                      child: Text("model.allDocumentResponse!.title![index]"),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
