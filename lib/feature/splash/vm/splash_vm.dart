import 'package:flutteronimo/common/repositories/user/user_repository.dart';
import 'package:flutteronimo/common/utils/logger/logger.dart';
import 'package:flutteronimo/common/utils/rx/stateful_subject.dart';

class SplashVm {
  final userLoggedInSubject = StatefulSubject<bool?>(value: null);

  final UserRepository userRepository;

  SplashVm({
    required this.userRepository,
  }) {
   _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    try {
      final isUserLoggedIn = await userRepository.isUserLoggedIn();
      userLoggedInSubject.push(isUserLoggedIn);
    } catch (object) {
      Logger().error(object.toString());
    }
  }

  void dispose() {
    userLoggedInSubject.dispose();
  }
}
