import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
      onViewModelReady: (model) async {
        model.onGetUserData(context);
      },
      viewModelBuilder: () => BaseModel(),
      builder: (context, model, child) => BaseUi(
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
                  ""))
        ],
      ),
    );
  }
}
