import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

class LocalStorage {
//set data into shared preferences like this
  Future<void> setString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

//get value from shared preferences
  Future<String?> getString(String? key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key!);
    // String? storage;
    // storage = prefs.getString(key!);
    // return storage;
  }

//set data into shared preferences like this
  Future<void> setStringList(String key, List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, value);
  }

  // get data
  Future<List<String>?> getStringList(String? key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key!);
  }

  // get the state of complete kyc form
  Future<bool> setCompleteKycField(String? key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key!, value).then((value) {
      print("value from shared preference");
    });
    return true;
  }

// set the state of complete kyc form
  Future<bool?> getCompleteKycField(String? key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool? storage;
    storage = pref.getBool(key!);
    return storage;
  }
}
