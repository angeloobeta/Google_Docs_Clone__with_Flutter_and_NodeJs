import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';
import 'package:google_docs_clone/views/pages/home/homePage.dart';
import 'package:google_docs_clone/views/pages/splashScreen.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute =
    RouteMap(routes: {'/Na': (routes) => const MaterialPage(child: SignIn())});
final loggedInRoute = RouteMap(
    routes: {'/signIn': (routes) => const MaterialPage(child: HomePage())});

final splashScreenRoute = RouteMap(routes: {
  'splashPage': (routes) => const MaterialPage(child: SplashPage())
});
