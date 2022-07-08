import 'package:auto_route/auto_route.dart';
import 'package:etiya_flutter_assignment/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setDouble('initialScrollPosition', 0);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = $RootRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      routerDelegate: _appRouter.delegate(
              initialDeepLink: '/home',
              navigatorObservers: () => [AutoRouterObserver()]),
          routeInformationProvider: _appRouter.routeInfoProvider(),
          routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
