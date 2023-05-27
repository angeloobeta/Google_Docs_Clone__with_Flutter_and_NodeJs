import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';
import 'package:google_docs_clone/viewModel/document/documentViewModel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DocumentViewModel>.reactive(
      onViewModelReady: (model) async {
        model.onGetUserData(context);
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
                  model.getUserDataResponse == null
                      ? "Refresh"
                      : model.getUserDataResponse!.user!.email!,
                  grey,
                  1,
                  12,
                  FontWeight.normal,
                  "")),
          AdaptivePositioned(
            left: 20,
            // FutureBuilder(
            //   future: GetDocument.getDocumentFunction(
            //           token: "", cancellationToken: CancellationToken()),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return loading();
            //     }
            //     return ListView.builder(
            //         itemCount: snapshot.data,
            //         itemBuilder: (context, index) {
            //           return ListView.builder(
            //               itemCount: snapshot.data[index].,
            //               itemBuilder: (context, index) {
            //                 return Card(
            //                   child: Text(""),
            //                 );
            //               });
            //         });
            //   },
            // )
            S(
              child: ListView.builder(
                  itemCount: model.getUserDataResponse != null
                      ? model.getUserDataResponse!.user!.sId!.length
                      : 0,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Text(""),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
