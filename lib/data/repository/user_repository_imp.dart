import 'package:dio/dio.dart';
import 'package:example/domain/entities/user.dart';

import 'package:example/core/network/network_exception.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repositories/user_repository.dart';
import '../datasource/remote/user_datasource.dart';

class UserRepositoryImp implements UserRepository{
  final UserRemoteDataSource userDataSource;
  UserRepositoryImp(
   this.userDataSource,
  );

  @override
  Future<Either<NetworkException, User>> getUser(int id) async{
    try {
      final response = await userDataSource.getUser(id);
      return Right(response.toEntity());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioException(e));
    }
  }

  @override
  Future<Either<NetworkException, List<User>>> getUsers() async{
    try {
      final response = await userDataSource.getUsers();
      return Right(response.map((e) => e.toEntity()).toList());
    } on DioException catch (e) {
      return Left(NetworkException.fromDioException(e));
    }
  }

  

}