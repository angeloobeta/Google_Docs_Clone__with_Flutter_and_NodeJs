import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
      onViewModelReady: (model) async {
        // model.onSignInWithGoogle(context);
        // await model.onGetDocument(context);
        // model.socketRepository.joinRoom("documentId");
        model.loginResponse;
      },
      viewModelBuilder: () => BaseModel(),
      builder: (context, model, child) => BaseUi(
        safeTop: true,
        children: [
          AdaptivePositioned(
              left: 20,
              GeneralTextDisplay(
                  model.loginResponse == null
                      ? "Refresh"
                      : model.loginResponse!.user!.email!,
                  grey,
                  1,
                  12,
                  FontWeight.normal,
                  ""))
        ],
      ),
    );
  }
}
