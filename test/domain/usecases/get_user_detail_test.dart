import 'package:dio/dio.dart';
import 'package:example/app_configs/env_config.dart';
import 'package:example/core/constants/app_constants.dart';
import 'package:example/core/network/network_manager.dart';
import 'package:example/data/datasource/remote/user_datasource.dart';
import 'package:example/data/repository/user_repository_imp.dart';
import 'package:example/domain/usecases/get_user_detail.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  late Dio dio;
  late NetworkManager networkManager;
  late UserRemoteDataSource userRemoteDataSource;
  late UserRepositoryImp userRepository;
  late GetUserDetail getUserDetail;

  setUp(() async{
    dio = Dio();
    await EnvConfig.init();
    dio.options.baseUrl = AppConstants.apiBaseUrl;
    dio.options.responseType = ResponseType.json;
    networkManager = NetworkManager();
    userRemoteDataSource = UserRemoteDataSource(networkManager);
    userRepository = UserRepositoryImp(userRemoteDataSource);
    getUserDetail = GetUserDetail(userRepository);
  });

  group("Get User Detail", () { 
    test("fromJson", () async {
      const int userId = 1;
      var result = await getUserDetail.execute(userId);
      expect(true, result.isRight());
    });
  });
}