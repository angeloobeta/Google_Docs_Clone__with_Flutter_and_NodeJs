import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';
import 'package:google_docs_clone/viewModel/document/documentViewModel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DocumentViewModel>.reactive(
      onViewModelReady: (model) async {
        await model.onGetDocument(context);
      },
      viewModelBuilder: () => DocumentViewModel(),
      builder: (context, model, child) => BaseUi(
        children: [
          AdaptivePositioned(Center(
            child: Container(
              width: sS(context).cW(width: 100),
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return S(
                    h: sS(context).cH(height: 50),
                    child: Card(
                      child: Center(),
                    ),
                  );
                },
              ),
            ),
          ))
        ],
      ),
    );
  }
}
