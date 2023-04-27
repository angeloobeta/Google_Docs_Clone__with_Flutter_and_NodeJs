import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

Widget loading({Color? color}) {
  return S(
    h: 60,
    w: 60,
    child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color ?? white),
        backgroundColor: blue),
  );
}
