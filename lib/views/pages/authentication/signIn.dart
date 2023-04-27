import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
        viewModelBuilder: () => BaseModel(),
        builder: (context, model, child) => BaseUi(
              children: [
                AdaptivePositioned(Center(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Image.asset(
                      'images/g-logo-2.png',
                      height: 20,
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
                ))
              ],
            ));
  }
}
