import 'package:example/data/datasource/remote/user_datasource_manager.dart';
import 'package:example/data/models/user_model.dart';

import '../../../core/constants/url_constants.dart';
import '../../../core/network/network_manager.dart';

class UserRemoteDataSource extends UserDataSourceManager{
  final NetworkManager networkManager;
  UserRemoteDataSource(this.networkManager);

  @override
  Future<UserModel> getUser(int id) async {
    try {
      var result = await networkManager.get(
       "${UrlConstants.users}/$id"
      );
      return UserModel.fromJson(result.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<UserModel>> getUsers() async{
    try {
      var result = await networkManager.get(
       UrlConstants.users
      );
      return List<UserModel>.from(result.data.map((x) => UserModel.fromJson(x)));
    } catch (e) {
      rethrow;
    }
  }


}