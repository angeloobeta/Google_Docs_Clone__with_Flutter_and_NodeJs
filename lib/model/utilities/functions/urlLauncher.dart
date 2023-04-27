import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

Future<void> makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

Future<void> launchInWebViewOrVC(String url, BuildContext context,
    {String? socialMedia}) async {
  if (!await launchUrl(
    Uri.parse(url),
    mode: LaunchMode.inAppWebView,
    webViewConfiguration: const WebViewConfiguration(
        headers: <String, String>{'my_header_key': 'my_header_value'}),
  )) {
    loaderWithClose(context,
        text: "Can not load, search for the name on $socialMedia!");
  }
}
