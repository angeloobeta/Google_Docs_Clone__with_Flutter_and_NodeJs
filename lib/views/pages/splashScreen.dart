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
                  child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 800),
                      child: model.image),
                  top: 388,
                  left: 98)
            ]));
  }
}
