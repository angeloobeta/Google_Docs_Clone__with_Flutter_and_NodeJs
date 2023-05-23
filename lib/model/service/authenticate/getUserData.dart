import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class GetUserData {
  static Future getUserData(
      {required String token,
      required CancellationToken cancellationToken}) async {
    Map<String, String> header = {"x-authorisation-token": token};

    //
    try {
      var response = HttpClientHelper.get(
        Uri.parse(baseUrl),
        cancelToken: cancellationToken,
        timeRetry: const Duration(milliseconds: 100),
        retries: 3,
        timeLimit: const Duration(milliseconds: 10),
      ).then((Response? response) {
        var parsed = response!.body;
        debugPrint(parsed);
        if (response.statusCode == 200) {
          return "";
        } else {
          return 'error';
        }
      });
    } catch (e) {}
  }
}
