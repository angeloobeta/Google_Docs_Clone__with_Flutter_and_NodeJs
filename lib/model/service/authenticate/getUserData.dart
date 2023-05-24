import 'package:google_docs_clone/model/models/getUserDataResponse.dart';
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

// class GetUserData {
//   static Future getUserData(
//       {required String token,
//       required CancellationToken cancellationToken}) async {
//     Map<String, String> header = {"x-authorisation-token": token};
//
//     //
//     try {
//       var respond = HttpClientHelper.get(
//         Uri.parse(baseUrl),
//         cancelToken: cancellationToken,
//         headers: header,
//         timeRetry: const Duration(milliseconds: 100),
//         retries: 3,
//         timeLimit: const Duration(milliseconds: 10),
//       ).then((Response? response) {
//         var parsed = response!.body;
//         developer.log("Data from GetUserData: $parsed");
//         if (response.statusCode == 200) {
//           developer.log("Check the status code");
//           var decoded = jsonDecode(parsed);
//           return GetUserDataResponse.fromMap(decoded);
//         } else {
//           return 'error';
//         }
//       });
//       return respond;
//     } on OperationCanceledError catch (e) {
//       print(e);
//       developer.log(e.toString());
//     }
//   }
// }

// this service is used to get the user details for google docs

class GetUserData {
  // function to get user account details
  static Future getUserData(
      {required String token,
      required CancellationToken cancellationToken}) async {
    Map<String, String> header = {
      'accept': 'application/json',
      // "Authorization": userToken,
      "x-authorisation-token": token
    };
    try {
      //
      var respond = get(Uri.parse(baseUrl), headers: header).then((response) {
        var parsed = response.body;
        // print("");
        // print("This is the response-body of login user data");
        print(response.body);

        if (response.statusCode == 200) {
          Map<String, dynamic> decoded = json.decode(parsed);
          return GetUserDataResponse.fromMap(decoded);
        } else {
          // print('i am parsed $parsed');
          return "error";
        }
      });
      return respond;
    } on OperationCanceledError catch (e) {
      debugPrint(e.stackTrace.toString());
      debugPrint(e.msg.toString());
    }
  }
}
