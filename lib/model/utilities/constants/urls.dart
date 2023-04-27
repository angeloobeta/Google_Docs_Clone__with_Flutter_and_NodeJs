// base url
const String baseUrl = "https://phplaravel-779602-2789902.cloudwaysapps.com/";

// authentication urls
const String registerUrl = "${baseUrl}api/register";
const String loginUrl = "${baseUrl}api/login";
const String logoutUrl = "${baseUrl}api/logout";
const String verifyPhoneNumberUrl = "${baseUrl}api/verify-phone-number";
const String sendOtpUrl = "${baseUrl}api/user/send-otp";
const String verifyOtpUrl = "${baseUrl}api/user/verify-otp";
const String forgotPasswordUrl = "${baseUrl}api/forgot-password";
const String changePasswordUrl = "${baseUrl}api/change-password";
const String photoUrl = "${baseUrl}storage/";
const String sendOtpWithoutTokenUrl = "${baseUrl}api/send-otp";
const String veriftyOtpWithoutTokenUrl = "${baseUrl}api/verify-otp";
const String loginWithFaceIdUrl = "${baseUrl}api/login-face-id";

// user api url
const String userDataUrl = "${baseUrl}api/user";
const String homeInfoUrl = "${baseUrl}api/user/home";
const String homePageHistoryUrl = "${baseUrl}api/payment/transaction-history";

// notification url
const String homePageNotificationUrl = "${baseUrl}api/user/notifications";
const String notificationAsReadUrl =
    "${baseUrl}api/user/notifications/mark-as-read/";

// socket url
const String socketUrl = 'https://mycircle-chat-server.onrender.com/';
