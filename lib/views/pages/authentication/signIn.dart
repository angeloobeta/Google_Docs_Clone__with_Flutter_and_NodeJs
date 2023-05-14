import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';
import 'package:google_docs_clone/viewModel/authentication/signInViewModel.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
        onViewModelReady: (model) {
          // model.googleSignAuth.signInWithGoogle();
        },
        viewModelBuilder: () => SignInViewModel(),
        builder: (context, model, child) => BaseUi(
              children: [
                AdaptivePositioned(
                  top: sS(context).h * 0.6,
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        model.googleSignAuth.signInWithGoogle();
                      },
                      icon: Image.asset(
                        'assets/images/g-logo-2.png',
                        height: 18,
                      ),
                      label: const Text(
                        "Sign in with Google",
                        style: TextStyle(color: black),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: white,
                          minimumSize: const Size(100, 50),
                          maximumSize: const Size(200, 80),
                          alignment: Alignment.center),
                    ),
                  ),
                ),
              ],
            ));
  }
}
