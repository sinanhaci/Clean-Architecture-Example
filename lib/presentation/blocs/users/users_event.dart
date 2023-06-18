part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class UserList extends UsersEvent {
  const UserList();

  @override
  List<Object> get props => [];
}


class RequestUserList extends UsersEvent {
  const RequestUserList();

  @override
  List<Object> get props => [];
}

class UserSearch extends UsersEvent {
  final String query;
  const UserSearch(this.query);

  @override
  List<Object> get props => [query];
}



