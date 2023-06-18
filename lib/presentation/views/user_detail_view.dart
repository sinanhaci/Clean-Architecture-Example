import 'package:auto_route/auto_route.dart';
import 'package:example/core/extensions/context_extension.dart';
import 'package:example/presentation/blocs/user_detail/user_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/user_detail/user_detail_event.dart';

@RoutePage(name: "userDetail")
class UserDetailView extends StatefulWidget {
  final int? userId;
  const UserDetailView({super.key, required this.userId});

  @override
  State<UserDetailView> createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> {
  @override
  void initState() {
    super.initState();
    context.read<UserDetailBloc>().add(RequestUserDetail(widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailBloc, UserDetailState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("User Detail"),
          ),
          body: Padding(
            padding: context.paddingMedium,
            child: BlocBuilder<UserDetailBloc, UserDetailState>(
              builder: (context, state) {
                if (state is UserDetailInitial || state is UserDetailLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is UserDetailHasError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if(state is UserDetailNotFound){
                  return const Center(
                    child: Text("User not found"),
                  );
                }else if(state is UserDetailHasData){
                  return Center(
                  child: Text(state.user.toString()),
                );
                }
                return const Center();
              },
            ),
          ),
        );
      },
    );
  }
}
