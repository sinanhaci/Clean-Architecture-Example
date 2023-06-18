import 'package:dio/dio.dart';
import 'package:example/app_configs/env_config.dart';
import 'package:example/core/constants/app_constants.dart';
import 'package:example/core/network/network_manager.dart';
import 'package:example/data/datasource/remote/user_datasource.dart';
import 'package:example/data/repository/user_repository_imp.dart';
import 'package:example/domain/usecases/get_user_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  late Dio dio;
  late NetworkManager networkManager;
  late UserRemoteDataSource userRemoteDataSource;
  late UserRepositoryImp userRepository;
  late GetUserList getUserList;

  setUp(() async{
    dio = Dio();
    await EnvConfig.init();
    dio.options.baseUrl = AppConstants.apiBaseUrl;
    dio.options.responseType = ResponseType.json;
    networkManager = NetworkManager();
    userRemoteDataSource = UserRemoteDataSource(networkManager);
    userRepository = UserRepositoryImp(userRemoteDataSource);
    getUserList = GetUserList(userRepository);
  });

  group("Get User List", () { 
    test("fromJson", () async {
      var result = await getUserList.execute();
      expect(true, result.isRight());
    });
  });
}