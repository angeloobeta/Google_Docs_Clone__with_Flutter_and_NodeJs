// base url
// const String baseUrl = "https://phplaravel-779602-2789902.cloudwaysapps.com/";
const String baseUrl = "http://localhost:3030/";

// authentication urls
const String registerUrl = "${baseUrl}api/register";
const String loginUrl = "${baseUrl}api/login";
const String logoutUrl = "${baseUrl}api/logout";

//  document urls
const String createDocument = "${baseUrl}api/docs/create";
const String titleDocument = "${baseUrl}api/docs/title";
const String documentId = "${baseUrl}api/docs/:id";
const String getDocuments = "${baseUrl}api/docs/me";

// user api url
const String userDataUrl = "${baseUrl}api/user";
const String homeInfoUrl = "${baseUrl}api/user/home";
const String homePageHistoryUrl = "${baseUrl}api/payment/transaction-history";

// socket url
const String socketUrl = 'https://mycircle-chat-server.onrender.com/';
