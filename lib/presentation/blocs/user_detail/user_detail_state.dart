part of 'user_detail_bloc.dart';

abstract class UserDetailState extends Equatable {
  const UserDetailState();
  
  @override
  List<Object> get props => [];
}

class UserDetailInitial extends UserDetailState {}

class UserDetailLoading extends UserDetailState {}

class UserDetailHasError extends UserDetailState {
  final String message;

  const UserDetailHasError(this.message);

  @override
  List<Object> get props => [message];
}

class UserDetailNotFound extends UserDetailState {}

class UserDetailHasData extends UserDetailState {
  final User user;

  const UserDetailHasData(this.user);

  @override
  List<Object> get props => [];
}
