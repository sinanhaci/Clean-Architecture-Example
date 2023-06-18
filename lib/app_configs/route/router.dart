import 'package:auto_route/auto_route.dart';
import 'package:example/app_configs/route/route_path.dart';
import 'package:example/presentation/views/users_view.dart';
import 'package:flutter/material.dart';
import '../../presentation/views/user_detail_view.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: Users.page,
      initial: true,
      path: RoutePath.users
    ),
    AutoRoute(
      page: UserDetail.page,
      path: RoutePath.userDetail
    )
  ];
}
