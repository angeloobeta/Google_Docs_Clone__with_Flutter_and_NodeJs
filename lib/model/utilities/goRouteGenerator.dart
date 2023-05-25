import 'package:go_router/go_router.dart';
import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';
import 'package:google_docs_clone/views/pages/home/DocumentPage.dart';
import 'package:google_docs_clone/views/pages/home/homePage.dart';
import 'package:google_docs_clone/views/pages/splashScreen.dart';

class GoRouteGenerator {
  static GoRouter generateRoute = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: splashPage,
    routes: [
      GoRoute(
          name: splashPage,
          path: splashPage,
          pageBuilder: (context, GoRouterState state) =>
              const MaterialPage(child: SplashPage()),
          builder: (context, GoRouterState state) => const SplashPage()),
      GoRoute(
          name: signIn,
          path: signIn,
          pageBuilder: (context, GoRouterState state) =>
              MaterialPage(key: state.pageKey, child: const SignIn())),
      GoRoute(
          name: homePage,
          path: homePage,
          pageBuilder: (context, GoRouterState state) =>
              MaterialPage(key: state.pageKey, child: const HomePage()),
          routes: [
            GoRoute(
                name: 'documentPage',
                path: 'document/:id',
                pageBuilder: (context, GoRouterState state) => MaterialPage(
                    key: state.pageKey,
                    child: DocumentPage(
                      id: state.pathParameters['id'],
                    ))),
          ])
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      key: state.pageKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Text(state.error.toString()),
        ),
      ),
    ),
  );
}

// look at the difference b/w builder and pageBuilder
