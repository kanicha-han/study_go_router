// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// final GlobalKey<NavigatorState> _rootNavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'root');
// // ShellRoute用のKeyを追加
// final GlobalKey<NavigatorState> _shellNavigatorKey =
//     GlobalKey<NavigatorState>(debugLabel: 'shell');

// @riverpod
// class AppRouter extends _$AppRouter {
//   @override
//   GoRouter build() {
//     // 現在のlocationを取得
//     final current = GoRouterState.of(context).location;

//     return GoRouter(
//       navigatorKey: _rootNavigatorKey,
//       debugLogDiagnostics: kDebugMode,
//       initialLocation: AppRoutes.splashPage,
//       routes: <RouteBase>[
//         // ShellRouteを追加
//         ShellRoute(
//           navigatorKey: _shellNavigatorKey,
//           builder: (BuildContext context, GoRouterState state, Widget child) {
//             // ShellRouteで、AppLayout的なScaffoldを返す
//             return Scaffold(
//               appBar: AppBar(
//                 // ShellRoute内だと、戻るボタンが表示されないので処理を追加
//                 leading: _showLeading(context) ? _leadButton(context) : null,
//                 title: Text("My Sample App"),
//               ),
//               body: Center(child: child),
//             );
//           },
//           // 自動生成した元のroutesを設定
//           routes: $appRoutes,
//         ),
//       ],
//     );
//   }
// }
