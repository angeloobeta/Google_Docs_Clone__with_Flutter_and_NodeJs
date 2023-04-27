// creating a function to prevent calling catch error and try catch in multiple places
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

runFunctionForApi(
  BuildContext context, {
  required Future functionToRunService,
  required Function(dynamic) functionToRunAfterService,
}) {
  try {
    // loading
    loadingDialog(context, text: "");
    // run function
    functionToRunService.then((value) {
      if (functionToRunAfterService(value) == true) {
        // function run successfully
        // close loading
        Navigator.pop(context);
        return true;
      }
      if (value is Map) {
        Navigator.pop(context);
        loaderWithClose(context, text: value['message'] ?? undefinedError);
      }
    }).catchError((onError, stackTrace) {
      print(onError);
      print(stackTrace);
      if (onError is SocketException) {
        Navigator.pop(context);
        loaderWithClose(context, text: networkError);
      } else {
        Navigator.pop(context);
        loaderWithClose(context, text: undefinedError);
      }
    });
  } catch (onError, stacktrace) {
    print(onError);
    print(stacktrace);
    if (onError is SocketException) {
      Navigator.pop(context);
      loaderWithClose(context, text: networkError);
    } else {
      Navigator.pop(context);
      loaderWithClose(context, text: undefinedError);
    }
  }
}
