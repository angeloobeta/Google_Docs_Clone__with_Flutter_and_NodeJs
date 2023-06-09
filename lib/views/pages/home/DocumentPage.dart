import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:go_router/go_router.dart';
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class DocumentPage extends StatelessWidget {
  String? id;
  DocumentPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DocumentViewModel>.reactive(
      viewModelBuilder: () => DocumentViewModel(),
      onViewModelReady: (model) {
        model.onFetchAllDocument(context);
      },
      builder: (context, model, child) => BaseUi(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_outlined, color: red),
          ),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/docs-logo.png",
                  height: 40,
                ),
                S(w: 10),
                S(
                  h: 30,
                  w: 120,
                  child: TextField(
                    controller: model.documentTitleEditingController,
                    decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: docsBlue)),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 10)),
                  ),
                )
              ],
            ),
          ),
          elevation: 1,
          backgroundColor: white,
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton.icon(
                onPressed: () => GoRouter.of(context).pop(),
                icon: const Icon(
                  Icons.lock,
                  size: 18,
                ),
                label: const Text("Share"),
                style: ElevatedButton.styleFrom(backgroundColor: docsBlue),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: grey.shade100)),
            ),
          ),
        ),
        safeTop: true,
        children: [
          AdaptivePositioned(
              top: 20,
              left: 10,
              right: 10,
              S(
                h: 600,
                child: Column(
                  children: [
                    quill.QuillToolbar.basic(controller: model.quillController),
                    Expanded(
                      child: Card(
                        elevation: 4,
                        child: quill.QuillEditor.basic(
                          controller: model.quillController,
                          readOnly: false, // true for view only mode
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
