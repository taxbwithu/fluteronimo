import 'package:flutteronimo/common/dependency_factories/service_factory.dart';
import 'package:flutteronimo/common/repositories/deals/deals_repository.dart';
import 'package:flutteronimo/common/repositories/deals/stub_deals_repository.dart';
import 'package:flutteronimo/common/repositories/stores/stores_repository.dart';
import 'package:flutteronimo/common/repositories/stores/stub_stores_repository.dart';

import '../../app/environment.dart';
import '../repositories/multilocale/multilocale_repository.dart';
import '../repositories/storage_and_settings/shared_preferences_storage.dart';
import '../repositories/storage_and_settings/system_secure_storage.dart';
import '../services/http/http_service.dart';

class RepositoryFactory {
  final SystemSecureStorage secureStorage;
  final SharedPreferencesStorage sharedPreferencesStorage;

  RepositoryFactory({
    required HttpService httpService,
    required this.sharedPreferencesStorage,
    required this.secureStorage,
    required Environment environment,
  }) {
    _serviceFactory = ServiceFactory(
      httpService: httpService,
      systemSecureStorage: secureStorage,
      sharedPreferencesStorage: sharedPreferencesStorage,
      environment: environment,
    );

    _multiLocaleRepository = MultiLocaleRepository(
      sharedPrefs: _serviceFactory.sharedPreferencesStorage,
    );
  }

  late ServiceFactory _serviceFactory;
  late MultiLocaleRepository _multiLocaleRepository;

  MultiLocaleRepository createMultiLocaleRepository() {
    return _multiLocaleRepository;
  }

  DealsRepository createDealsRepository() {
    return StubDealsRepository(
      service: _serviceFactory.createDeals(),
    );
  }

  StoresRepository createStoresRepository() {
    return StubStoresRepository(
      service: _serviceFactory.createStoresService(),
      storage: sharedPreferencesStorage,
    );
  }
}
