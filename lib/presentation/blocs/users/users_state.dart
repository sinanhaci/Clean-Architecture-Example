part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();
  
  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersHasError extends UsersState {
  final String message;

  const UsersHasError(this.message);

  @override
  List<Object> get props => [message];
}

class UserHasData extends UsersState {
  final List<User> users;

  const UserHasData(this.users);

  @override
  List<Object> get props => [users];
}

class SearchLoadedEmpty extends UsersState {}

class SearchLoaded extends UsersState {
  final List<User> users;

  const SearchLoaded(this.users);

  @override
  List<Object> get props => [users];
}

class SearchLoadedError extends UsersState {
  final String message;

  const SearchLoadedError(this.message);

  @override
  List<Object> get props => [message];
}