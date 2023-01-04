import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutteronimo/common/repositories/deals/deals_repository.dart';
import 'package:flutteronimo/common/repositories/storage_and_settings/shared_preferences_storage.dart';

import '../../app/environment.dart';
import '../dependency_factories/repository_factory.dart';
import '../dependency_factories/validator_factory.dart';
import '../services/http/dio_http_service.dart';
import '../services/oauth_service.dart';
import 'multilocale/multilocale_repository.dart';
import 'storage_and_settings/system_secure_storage.dart';

class DependencyGraph {
  Environment environment;
  late DioHttpService _httpService;
  late RepositoryFactory _repositoryFactory;
  final _validatorFactory = ValidatorFactory();

  static const _flutterSecureStorage = FlutterSecureStorage();
  final systemSecureStorage =
      SystemSecureStorage(storage: _flutterSecureStorage);
  final _sharedPreferencesStorage = SharedPreferencesStorage();

  DependencyGraph({
    required this.environment,
  }) {
    _httpService = DioHttpService(
      oAuthService: OAuthService(
        environment: environment,
        storageService: systemSecureStorage,
      ),
      environment: environment,
      sharedPreferencesService: _sharedPreferencesStorage,
      systemSecureStorage: systemSecureStorage,
    );

    _repositoryFactory = RepositoryFactory(
      httpService: _httpService,
      sharedPreferencesStorage: _sharedPreferencesStorage,
      secureStorage: systemSecureStorage,
      environment: environment,
    );
  }

  MultiLocaleRepository getMultiLocaleRepository() {
    return _repositoryFactory.createMultiLocaleRepository();
  }

  DealsRepository getDealsRepository() {
    return _repositoryFactory.createDealsRepository();
  }
}
