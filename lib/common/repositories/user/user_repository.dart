import 'package:flutteronimo/common/data_models/user/user_data.dart';

abstract class UserRepository {
  Future<UserData> getUserData();

  Future<bool> isUserLoggedIn();
}