import 'package:dio/dio.dart';

import '../../../repositories/storage_and_settings/system_secure_storage.dart';
import '../../../utils/logger/logger.dart';

class NetworkLoggerInterceptor extends InterceptorsWrapper {
  late Dio dio;
  final SystemSecureStorage systemSecureStorage;

  NetworkLoggerInterceptor({
    required this.dio,
    required this.systemSecureStorage,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    Logger().debug('REQUEST[${options.method}] \n'
        '[URL]${options.uri} \n'
        'DATA: ${options.data} \n'
        'QUERY-PARAMS: ${options.queryParameters} \n'
        '[HEADERS]: ${options.headers}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Logger().debug(
      'RESPONSE => [${response.requestOptions.uri}] \n'
      'STATUSCODE: ${response.statusCode} \n'
      '[RESPONSE-DATA]: ${response.data}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(
    DioError error,
    ErrorInterceptorHandler handler,
  ) async {
    Logger().debug('[ERROR] => ${error.requestOptions.uri} \n'
        '[STATUS-CODE]: ${error.response?.statusCode} \n'
        '[MESSAGE]: ${error.message} \n');

    super.onError(error, handler);
  }
}
