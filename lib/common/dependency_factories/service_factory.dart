import 'package:flutteronimo/common/services/deals_service.dart';

import '../../app/environment.dart';
import '../repositories/storage_and_settings/shared_preferences_storage.dart';
import '../repositories/storage_and_settings/system_secure_storage.dart';
import '../services/http/http_service.dart';

class ServiceFactory {
  final HttpService httpService;
  final SharedPreferencesStorage sharedPreferencesStorage;
  final SystemSecureStorage systemSecureStorage;
  final Environment environment;

  ServiceFactory({
    required this.httpService,
    required this.systemSecureStorage,
    required this.sharedPreferencesStorage,
    required this.environment,
  });

  DealsService createDeals() => DealsService(
        httpService: httpService,
      );
}
