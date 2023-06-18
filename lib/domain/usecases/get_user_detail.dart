import 'package:dartz/dartz.dart';
import 'package:example/core/network/network_exception.dart';
import 'package:example/domain/entities/user.dart';
import '../repositories/user_repository.dart';

class GetUserDetail {
  final UserRepository userRepository;
  GetUserDetail(this.userRepository);

  Future<Either<NetworkException,User>> execute(int userId) async {
    return await userRepository.getUser(userId);
  }
}