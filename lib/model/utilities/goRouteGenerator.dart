import 'package:go_router/go_router.dart';
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';
import 'package:google_docs_clone/views/pages/home/homePage.dart';
import 'package:google_docs_clone/views/pages/splashScreen.dart';

class GoRouteGenerator {
  static GoRouter generateRoute = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: splashPage,
    routes: [
      GoRoute(
          path: splashPage,
          builder: (BuildContext context, GoRouterState state) =>
              const SplashPage(),
          routes: [
            GoRoute(
                path: signIn,
                builder: (BuildContext context, GoRouterState state) =>
                    const SignIn()),
            GoRoute(
                path: homePage,
                builder: (BuildContext context, GoRouterState state) =>
                    const HomePage()),
          ]),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: Center(
        child: Text(state.error.toString()),
      ),
    ),
  );
}
