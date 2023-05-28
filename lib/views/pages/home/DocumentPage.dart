import 'package:go_router/go_router.dart';
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class DocumentPage extends StatelessWidget {
  String? id;
  DocumentPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
      viewModelBuilder: () => BaseModel(),
      builder: (context, model, child) => BaseUi(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => GoRouter.of(context).pop(),
            icon: const Icon(Icons.arrow_back_outlined, color: red),
          ),
          title: GeneralTextDisplay(
              id.toString(), black, 1, 18, FontWeight.normal, ""),
          elevation: 1,
          backgroundColor: white,
          actions: [
            IconButton(
              onPressed: () => GoRouter.of(context).pop(),
              icon: const Icon(Icons.save_rounded, color: black),
            )
          ],
        ),
        safeTop: true,
        children: [
          AdaptivePositioned(
              left: 20,
              GeneralTextDisplay(
                  id.toString(), grey, 1, 12, FontWeight.normal, ""))
        ],
      ),
    );
  }
}
