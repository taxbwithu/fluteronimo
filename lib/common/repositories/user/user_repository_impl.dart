import 'package:flutteronimo/common/data_models/user/user_data.dart';
import 'package:flutteronimo/common/repositories/storage_and_settings/system_secure_storage.dart';
import 'package:flutteronimo/common/repositories/user/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final SystemSecureStorage secureStorage;

  UserRepositoryImpl({
    required this.secureStorage,
  });

  @override
  Future<UserData> getUserData() async {
    // TODO: implement getUserData
    throw UnimplementedError();
  }

  @override
  Future<bool> isUserLoggedIn() async {
    return false;
  }
}
