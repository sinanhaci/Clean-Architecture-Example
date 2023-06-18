import 'package:dartz/dartz.dart';
import 'package:example/core/network/network_exception.dart';
import 'package:example/domain/entities/user.dart';

abstract class UserRepository {
  Future<Either<NetworkException,User>> getUser(int id);
  Future<Either<NetworkException,List<User>>> getUsers();
}