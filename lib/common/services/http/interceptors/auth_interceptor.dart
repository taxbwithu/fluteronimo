import 'package:dio/dio.dart';

import '../../../repositories/multilocale/multilocale_repository.dart';
import '../../../repositories/storage_and_settings/data_model/shared_preference_key.dart';
import '../../../repositories/storage_and_settings/shared_preferences_storage.dart';
import '../../../repositories/storage_and_settings/system_secure_storage.dart';
import 'headers_factory.dart';

class AuthInterceptor extends Interceptor {
  final SystemSecureStorage systemSecureStorage;
  final SharedPreferencesStorage sharedPreferencesService;
  final _headersFactory = HeadersFactory();

  AuthInterceptor({
    required this.systemSecureStorage,
    required this.sharedPreferencesService,
  });

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final authorizationHeader = await _getAuthorizationHeader();
    options.headers.addAll(authorizationHeader);

    final acceptLanguageHeader = await _getAcceptLanguageHeader();
    options.headers.addAll(acceptLanguageHeader);

    final securityHeader = _headersFactory.makeSecurityHeader();
    options.headers.addAll(securityHeader);

    super.onRequest(options, handler);
  }

  Future<Map<String, String>> _getAuthorizationHeader() async {
    final accessToken = await systemSecureStorage.readAccessToken() ?? "";
    return _headersFactory.makeAuthorization(accessToken);
  }

  Future<Map<String, String>> _getAcceptLanguageHeader() async {
    const key = SharedPreferenceKey.preferredLanguage;
    final storedLanguage =
        await sharedPreferencesService.getValueFor(key: key) as String?;

    if (storedLanguage != null) {
      return _headersFactory.makeAcceptLanguage(storedLanguage);
    }

    final defaultLanguage = MultiLocaleRepository.defaultLocale.toString();
    return _headersFactory.makeAcceptLanguage(defaultLanguage);
  }
}
