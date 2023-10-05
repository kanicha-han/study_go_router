import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:study_go_router/page/about.dart';
import 'package:study_go_router/page/home.dart';
import 'package:study_go_router/page/login.dart';
import 'package:study_go_router/page/user.dart';

part 'route.g.dart';

class AppRoutes {
  static const splashPage = "/splash";
  static const homePage = "/";
  static const userPage = "uid";
  static const loginPage = "/login";
}

// rootのState付きNavigator
final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell'); //shellRoute用のキー
final routerProvider = Provider(
  (ref) => GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.splashPage,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellNavigatorKey, // ボトムナビあり
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("My Sample App"),
            ),
            body: Center(child: child),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                switch (index) {
                  case 0:
                    HomeRoute().go(context);
                    break;
                  case 1:
                    MainRoute().go(context);
                    break;
                  case 2:
                    UserPageRoute(uid: 1).go(context);
                    break;
                }
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.adb), label: '仮'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_balance), label: 'user')
              ],
            ),
          );
        },
        routes: $appRoutes,
      ),
    ],
  ),
);

//<>はルート名
@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: <TypedGoRoute<GoRouteData>>[],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

// TOPレベルのパスには、@TypedGoRouteをつける
@TypedGoRoute<SplashRoute>(path: AppRoutes.splashPage)
class SplashRoute extends GoRouteData {
  const SplashRoute({this.fromPage});

  final String? fromPage;

  @override
  Widget build(BuildContext context, GoRouterState state) => LoginPage();
}

// ネストしたルートがある場合は、`@TypedGoRoute.routes`に記載
@TypedGoRoute<MainRoute>(path: AppRoutes.homePage, routes: [
  TypedGoRoute<UserPageRoute>(
      path: AppRoutes.userPage,
      routes: [TypedGoRoute<SplashRoute>(path: AppRoutes.homePage)]),
])
class MainRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => AboutPage();
}

// TOPレベルでない場合は、`@TypedGoRoute`をつけない
@immutable
class UserPageRoute extends GoRouteData {
  const UserPageRoute({required this.uid});
  final int uid;

  @override
  Widget build(BuildContext context, GoRouterState state) => UserPage(uid: uid);
}
