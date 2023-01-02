import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutteronimo/generated/l10n.dart';

import '../../../data_models/exceptions/revoke_token_exception.dart';
import '../../../data_models/webservice/webservice_error.dart';
import '../../../repositories/storage_and_settings/data_model/secure_storage_key.dart';
import '../../../repositories/storage_and_settings/system_secure_storage.dart';
import '../../oauth_service.dart';
import 'headers_factory.dart';

class RefreshInterceptor extends Interceptor {
  final SystemSecureStorage storageService;
  final OAuthService oAuthService;
  final _headersFactory = HeadersFactory();

  RefreshInterceptor(
    this.storageService,
    this.oAuthService,
  );

  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) async {
    final statusCode = dioError.response?.statusCode;
    final refreshToken = await storageService.readRefreshToken();

    if (statusCode == 401) {
      if (refreshToken == null) {
        final errorMessage = _getDioResponseErrorMessage(error: dioError);

        final revokeException = RevokeTokenException(
          message: errorMessage,
          options: dioError.response?.requestOptions,
        );

        handler.reject(revokeException);
        return;
      } else {
        try {
          final refreshResponse = await _tryRefresh(dioError.response);
          handler.resolve(refreshResponse);
          return;
        } on DioError catch (error) {
          handler.reject(error);
          return;
        }
      }
    }

    super.onError(dioError, handler);
  }

  Future<Response<dynamic>> _tryRefresh(Response? response) async {
    final client = Dio();

    final data = await oAuthService.refreshToken();
    await storageService.saveTokens(
      accessToken: data.accessToken,
      refreshToken: data.refreshToken,
    );

    final options = response?.requestOptions;

    if (options == null) {
      throw RevokeTokenException(
        message: 'Unavailable request option',
        options: RequestOptions(path: options?.path ?? ''),
      );
    }

    client.options.baseUrl = options.baseUrl;

    final accessToken = await storageService.readAccessToken();
    final authorizationHeader =
        _headersFactory.makeAuthorization(accessToken ?? "");
    return await client.request<dynamic>(
      options.path,
      cancelToken: options.cancelToken,
      data: options.data,
      onReceiveProgress: options.onReceiveProgress,
      onSendProgress: options.onSendProgress,
      queryParameters: options.queryParameters,
      options: Options(
        method: options.method,
        sendTimeout: options.sendTimeout,
        receiveTimeout: options.receiveTimeout,
        extra: options.extra,
        headers: options.headers..addAll(authorizationHeader),
        responseType: options.responseType,
        contentType: options.contentType,
        validateStatus: options.validateStatus,
        receiveDataWhenStatusError: options.receiveDataWhenStatusError,
        followRedirects: options.followRedirects,
        maxRedirects: options.maxRedirects,
        requestEncoder: options.requestEncoder,
        responseDecoder: options.responseDecoder,
        listFormat: options.listFormat,
      ),
    );
  }

  String _getDioResponseErrorMessage({
    required DioError error,
  }) {
    final response = error.response;

    if (response == null) {
      return 'Something went wrong';
    }

    final json = jsonDecode(response.data as String) as Map<String, dynamic>;
    final errorMessage = WebserviceError.fromJson(json);

    return errorMessage.message ?? Texts.current.error_view_default_message;
  }
}

class RefreshTokenService {}
