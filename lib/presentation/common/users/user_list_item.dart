import 'package:auto_route/auto_route.dart';
import 'package:example/app_configs/route/router.dart';
import 'package:example/domain/entities/user.dart';
import 'package:flutter/material.dart';


class UserListItem extends StatelessWidget {
  final User? user;
  const UserListItem({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    if(user == null) return const Center();
    return ListTile(
      onTap: () => context.router.push(UserDetail(userId: user?.id)),
      title: Text(user?.name ?? ""),
      subtitle: Text(user?.email ?? ""),
    );
  }
}