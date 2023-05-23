import 'package:google_docs_clone/viewModel/splashScreen.dart';

import '../../model/utilities/imports/generalImport.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
        viewModelBuilder: () => SplashScreenViewModel(),
        onViewModelReady: (model) {
          model.future(context);
        },
        builder: (context, model, child) =>
            BaseUi(allowBackButton: false, children: [
              rowPositioned(
                top: sS(context).h * 0.35,
                child: Column(
                  children: [
                    GeneralTextDisplay(
                        "Google Docs Clone", black, 1, 20, FontWeight.bold, ""),
                    S(h: 50),
                    model.image,
                  ],
                ),
              )
            ]));
  }
}
