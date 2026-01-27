import 'package:flutteronimo/common/repositories/user/user_repository.dart';
import 'package:flutteronimo/common/utils/logger/logger.dart';
import 'package:flutteronimo/common/utils/rx/rx_extensions.dart';
import 'package:rxdart/rxdart.dart';

class SplashVm {
  final userLoggedInSubject = PublishSubject<bool?>();

  final UserRepository userRepository;

  SplashVm({
    required this.userRepository,
  }) {
   _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    try {
      final isUserLoggedIn = await userRepository.isUserLoggedIn();
      userLoggedInSubject.addSafe(isUserLoggedIn);
    } catch (object) {
      Logger().error(object.toString());
    }
  }

  void dispose() {
    userLoggedInSubject.close();
  }
}
