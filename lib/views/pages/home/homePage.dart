import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

import '../../../viewModel/socketClient/socketClientViewModel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SocketClientViewModel>.reactive(
      onViewModelReady: (model) async {
        // await model.onGetDocument(context);
        // model.socketRepository.joinRoom("documentId");
      },
      viewModelBuilder: () => SocketClientViewModel(),
      builder: (context, model, child) => BaseUi(
        children: [
          AdaptivePositioned(GeneralTextDisplay(
              model.loginResponse!.user!.email!,
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
