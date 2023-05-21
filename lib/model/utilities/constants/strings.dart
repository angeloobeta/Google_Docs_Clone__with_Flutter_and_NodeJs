// constants of string
// screen sizing
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

ScreenSize sS(
  BuildContext context,
) =>
    ScreenSize(context: context);

// socket.io instance

// notification type strings

// constant strings
const String tokenKey = 'token';

// page route string
const String onBoard = '/onBoard';
const String signIn = '/login';
const String chatHomePage = "/ChatHomePage";
const String newMessagePage = "/NewMessagePage";
const String homePage = "/HomePage";

// error string
const String networkError =
    'Unable to process request, check your network and try again later';
const String undefinedError = 'Error occurred, try gain later';
const String invalidBaseUrl = 'Unable to access host, invalid base url';
const String notificationRead = "Notification marked as read";
const String assetImagePlaceHolder = "assets/avatar.jpeg";
const String assetImagePlaceHolderRecipient = "assets/avatar2.png";
const String networkImagePlaceHolder =
    "https://www.gravatar.com/avatar/2c7d99fe281ecd3bcd65ab915bac6dd5?s=250";
const String invalidPassword =
    'Invalid password, Length must be more than 7 and contains lower case, upper case , digit and  symbol';
const String isEmptyString = " must be filled";

// strings for pin text

// string for unitester

// text for sharing applink

// socket io channel name

// primary swatch color map
final Map<int, Color> primarySwatchColor = {
  50: blue.withOpacity(0.1),
  100: blue.withOpacity(0.2),
  200: blue.withOpacity(0.3),
  300: blue.withOpacity(0.4),
  400: blue.withOpacity(0.5),
  500: blue.withOpacity(0.6),
  600: blue.withOpacity(0.7),
  700: blue.withOpacity(0.8),
  800: blue.withOpacity(0.9),
  900: blue.withOpacity(1.0),
};

// Instance

ValidateEmailAddress validateEmailAddress = ValidateEmailAddress();
LocalStorage localStorage = LocalStorage();
