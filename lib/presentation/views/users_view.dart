import 'package:auto_route/auto_route.dart';
import 'package:example/core/extensions/context_extension.dart';
import 'package:example/presentation/blocs/users/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../common/users/user_list_item.dart';


@RoutePage(name: "users")
class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  @override
  void initState() {
    super.initState();
    context.read<UsersBloc>().add(const RequestUserList());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersBloc, UsersState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Users'),
          ),
          body: Padding(
            padding: context.paddingNormalVertical,
            child: BlocBuilder<UsersBloc, UsersState>(
              builder: (context, state) {
                if (state is UsersInitial || state is UsersLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (state is UsersHasError) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                return _UsersListView();
              },
            ),
          ),
        );
      },
    );
  }
}

class _UsersListView extends StatelessWidget {
  final String _inputHintText = "Search User";
  @override
  Widget build(BuildContext context) {
    var userBloc = context.read<UsersBloc>();
    if (userBloc.users.isEmpty) {
      return const Center(
        child: Text("No data"),
      );
    }
    return ListView(
      children: [
        _searchField(context),
        _title(context),
        Builder(
          builder: (context) {
            if(userBloc.state is SearchLoadedEmpty){
              return _searchLoadedEmpty();
            }else if(userBloc.state is SearchLoadedError){
              return _searchLoadedError();
            }else if(userBloc.state is SearchLoaded){
              return _searchLoaded(context);
            }else{
              return _usersInitial(context);
            }
          },
        )
      ],
    );
  }

  Padding _title(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Text(
        "Users",
        style: context.textTheme.titleLarge,
      ),
    );
  }

  Padding _searchField(BuildContext context) {
    var userBloc = context.read<UsersBloc>();
    return Padding(
      padding: context.paddingLow,
      child: TextField(
        onChanged: (value){
          if(value.isEmpty){
            userBloc.add(const UserList());
          }else{
            userBloc.add(UserSearch(value));
          }
        },
        decoration: InputDecoration(
          labelText: _inputHintText,
          hintText: _inputHintText,
        ),
      ),
    );
  }

  _searchLoadedEmpty(){
    return const Center(
      child: Text("User not found!"),
    );
  }

  _searchLoadedError(){
    return const Center(
      child: Text("Error!"),
    );
  }

  _searchLoaded(BuildContext context){
    var userBloc = context.read<UsersBloc>();
    return  Column(
      children: List<Widget>.generate(userBloc.searchUser.length, (index) {
        var user = userBloc.searchUser[index];
        return UserListItem(
          user: user,
        );
      }),
    );
  }

  _usersInitial(BuildContext context){
    var userBloc = context.read<UsersBloc>();
    return  Column(
      children: List<Widget>.generate(userBloc.users.length, (index) {
        var user = userBloc.users[index];
        return UserListItem(
          user: user,
        );
      }),
    );
  }
}
