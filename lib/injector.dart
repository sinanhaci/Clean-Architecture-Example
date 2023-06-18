import 'package:example/presentation/blocs/user_detail/user_detail_bloc.dart';
import 'package:example/presentation/blocs/users/users_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/network/network_manager.dart';
import 'data/datasource/remote/user_datasource.dart';
import 'data/repository/user_repository_imp.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/get_user_detail.dart';
import 'domain/usecases/get_user_list.dart';


class Injector {
  static final GetIt injector = GetIt.instance;

  static Future<void> setup() async{


    injector.registerFactory(() => UsersBloc(injector()));
    injector.registerFactory(() => UserDetailBloc(injector()));

    injector.registerLazySingleton<GetUserList>(() => GetUserList(injector()));
    injector.registerLazySingleton<GetUserDetail>(() => GetUserDetail(injector()));
    
    injector.registerLazySingleton<UserRepository>(() => UserRepositoryImp(injector()));
    injector.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSource(injector()));

    injector.registerSingleton<NetworkManager>(NetworkManager());
    
  }
}
