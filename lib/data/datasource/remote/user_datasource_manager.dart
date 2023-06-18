import 'package:example/data/models/user_model.dart';

abstract class UserDataSourceManager{
  Future<List<UserModel>> getUsers();
  Future<UserModel> getUser(int id);
}