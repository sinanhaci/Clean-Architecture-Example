import 'package:equatable/equatable.dart';

abstract class UserDetailEvent extends Equatable {
  const UserDetailEvent();

  @override
  List<Object> get props => [];
}

class RequestUserDetail extends UserDetailEvent {
  final int? userId;
  const RequestUserDetail(this.userId);

  @override
  List<Object> get props => userId == null ? [] : [userId!];
}
