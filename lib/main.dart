import 'package:routemaster/routemaster.dart';

import 'model/utilities/imports/generalImport.dart';
import 'model/utilities/routeMaster.dart';

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
      routerDelegate: RoutemasterDelegate(routesBuilder: (context) {
        return splashScreenRoute;
      }),
      routeInformationParser: const RoutemasterParser(),
      // onGenerateRoute: RouteGenerator.generateRoute,
      // home: SplashPage(),
    );
  }
}
