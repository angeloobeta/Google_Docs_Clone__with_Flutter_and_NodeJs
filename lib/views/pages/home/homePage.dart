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
        appBar: AppBar(
          elevation: 1,
          backgroundColor: white,
          actions: [
            IconButton(
              onPressed: () {},
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
                  ""))
        ],
      ),
    );
  }
}
