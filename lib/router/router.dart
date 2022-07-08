import 'package:auto_route/auto_route.dart';
import 'package:etiya_flutter_assignment/router/router.gr.dart';
import 'package:etiya_flutter_assignment/screens/homescreen.dart';
import 'package:etiya_flutter_assignment/screens/viewrepo.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen, path: '/home', name: "home", initial: true),
     AutoRoute(
        page: ViewRepo, path: '/viewrepo:userRepo', name: "viewrepo", initial: false), 
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
class $RootRouter extends RootRouter {}