// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    Users.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UsersView(),
      );
    },
    UserDetail.name: (routeData) {
      final args = routeData.argsAs<UserDetailArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: UserDetailView(
          key: args.key,
          userId: args.userId,
        ),
      );
    },
  };
}

/// generated route for
/// [UsersView]
class Users extends PageRouteInfo<void> {
  const Users({List<PageRouteInfo>? children})
      : super(
          Users.name,
          initialChildren: children,
        );

  static const String name = 'Users';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UserDetailView]
class UserDetail extends PageRouteInfo<UserDetailArgs> {
  UserDetail({
    Key? key,
    required int? userId,
    List<PageRouteInfo>? children,
  }) : super(
          UserDetail.name,
          args: UserDetailArgs(
            key: key,
            userId: userId,
          ),
          initialChildren: children,
        );

  static const String name = 'UserDetail';

  static const PageInfo<UserDetailArgs> page = PageInfo<UserDetailArgs>(name);
}

class UserDetailArgs {
  const UserDetailArgs({
    this.key,
    required this.userId,
  });

  final Key? key;

  final int? userId;

  @override
  String toString() {
    return 'UserDetailArgs{key: $key, userId: $userId}';
  }
}
