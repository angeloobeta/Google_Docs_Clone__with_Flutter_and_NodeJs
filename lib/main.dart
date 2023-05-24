import 'model/utilities/goRouteGenerator.dart';
import 'model/utilities/imports/generalImport.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   onGenerateRoute: RouteGenerator.generateRoute,
    //   home: SplashPage(),
    // );

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: GoRouteGenerator.generateRoute.routerDelegate,
      routeInformationParser:
          GoRouteGenerator.generateRoute.routeInformationParser,
      routeInformationProvider:
          GoRouteGenerator.generateRoute.routeInformationProvider,
      // onGenerateRoute: RouteGenerator.generateRoute,
      // home: SplashPage(),
    );
  }
}
