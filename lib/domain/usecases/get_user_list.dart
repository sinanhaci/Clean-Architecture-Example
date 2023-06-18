import 'package:dartz/dartz.dart';
import 'package:example/core/network/network_exception.dart';

import '../entities/user.dart';
import '../repositories/user_repository.dart';

class GetUserList {
  final UserRepository repository;
  GetUserList(this.repository);

  Future<Either<NetworkException,List<User>>> execute() {
    return repository.getUsers();
  }
}