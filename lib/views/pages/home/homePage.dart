import 'package:go_router/go_router.dart';
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
          // Positioned(
          //     left: 20,
          //     top: 50,
          //     bottom: 20,
          //     child: SingleChildScrollView(
          //       child: Column(
          //         children: model.fetchAllDocumentResponse!.documents!
          //             .map((e) => GeneralTextDisplay(e.title.toString(), grey,
          //                 1, 12, FontWeight.normal, ""))
          //             .toList(),
          //       ),
          //     )),
          AdaptivePositioned(
              left: 20,
              right: 20,
              top: 45,
              S(
                h: 600,
                child: ListView.builder(
                    itemCount: model.fetchAllDocumentResponse != null
                        ? model.fetchAllDocumentResponse?.documents!.length
                        : 0,
                    itemBuilder: (context, index) => Card(
                          child: InkWell(
                            onTap: () => GoRouter.of(context)
                                .goNamed(documentPage, pathParameters: {
                              'id':
                                  "${index + 1}: ${model.fetchAllDocumentResponse!.documents![index].sId.toString()}"
                            }),
                            child: GeneralTextDisplay(
                                " ${index + 1}  ${model.fetchAllDocumentResponse!.documents![index].title.toString()}",
                                black,
                                1,
                                14,
                                FontWeight.normal,
                                ""),
                          ),
                        )),
              ))
        ],
      ),
    );
  }
}
