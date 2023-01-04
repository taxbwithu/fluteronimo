import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../app/environment.dart';
import '../../data_models/exceptions/multipart_file_exception.dart';
import '../../repositories/storage_and_settings/shared_preferences_storage.dart';
import '../../repositories/storage_and_settings/system_secure_storage.dart';
import '../base_url.dart';
import '../oauth_service.dart';
import 'api_version.dart';
import 'http_service.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/network_logger_interceptor.dart';
import 'interceptors/refresh_interceptor.dart';

class DioHttpService extends HttpService {
  late Dio _dio;
  final Environment environment;
  static const ApiVersion _defaultApiVersion = ApiVersion.v1;
  late String clientSecret;
  final SystemSecureStorage systemSecureStorage;
  final OAuthService oAuthService;

  DioHttpService({
    required this.environment,
    required this.systemSecureStorage,
    required SharedPreferencesStorage sharedPreferencesService,
    required this.oAuthService,
  }) {
    _dio = Dio(getOptions());

    final authInterceptor = AuthInterceptor(
        systemSecureStorage: systemSecureStorage,
        sharedPreferencesService: sharedPreferencesService);
    final refreshInterceptor =
        RefreshInterceptor(systemSecureStorage, oAuthService);
    final networkLoggerInterceptor = NetworkLoggerInterceptor(
      dio: _dio,
      systemSecureStorage: systemSecureStorage,
    );
    _dio.interceptors.add(authInterceptor);
    _dio.interceptors.add(refreshInterceptor);
    if (environment == Environment.dev || environment == Environment.qa) {
      _dio.interceptors.add(networkLoggerInterceptor);
    }
  }

  BaseOptions getOptions() {
    return BaseOptions(
      contentType: "application/json",
      baseUrl: BaseUrl.make(environment),
      connectTimeout: _getConnectTimeout(),
      receiveTimeout: _getReceiveTimeout(),
    );
  }

  String _buildPath({required String path, required ApiVersion apiVersion}) {
    return "/${apiVersion.apiString}$path";
  }

  @override
  Future<Response<T>> delete<T>({
    required String path,
    Map<String, String>? body,
    ApiVersion apiVersion = _defaultApiVersion,
  }) async {
    try {
      return await _dio.delete<T>(
          _buildPath(path: path, apiVersion: apiVersion),
          data: body);
    } on DioError catch (dioError) {
      throw await parseDioError(dioError);
    }
  }

  @override
  Future<Response<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    ApiVersion apiVersion = _defaultApiVersion,
  }) async {
    try {
      return await _dio.get(_buildPath(path: path, apiVersion: apiVersion),
          queryParameters: queryParameters);
    } on DioError catch (dioError) {
      throw await parseDioError(dioError);
    }
  }

  @override
  Future<Response<T>> patch<T>({
    required String path,
    Map<String, dynamic>? body,
    ApiVersion apiVersion = _defaultApiVersion,
  }) async {
    try {
      return await _dio.patch(_buildPath(path: path, apiVersion: apiVersion),
          data: body);
    } on DioError catch (dioError) {
      throw await parseDioError(dioError);
    }
  }

  @override
  Future<Response<T>> post<T>({
    required String path,
    Map<String, dynamic>? body,
    ApiVersion apiVersion = _defaultApiVersion,
    Options? options,
  }) async {
    try {
      return await _dio.post(
        _buildPath(path: path, apiVersion: apiVersion),
        data: body,
        options: options,
      );
    } on DioError catch (dioError) {
      throw await parseDioError(dioError);
    }
  }

  @override
  Future<Response<T>> postMultipart<T>({
    required String path,
    FormData? formData,
    ApiVersion apiVersion = _defaultApiVersion,
  }) async {
    try {
      return await _dio.post(
        _buildPath(path: path, apiVersion: apiVersion),
        data: formData,
        options: Options(contentType: "multipart/form-data"),
      );
    } on DioError catch (dioError) {
      //TODO MM 02.03.2022 delete below closure when bug will be resolved (in Dio library)
      // Still not fixed.
      // https://github.com/flutterchina/dio/issues/482
      if (dioError.type == DioErrorType.other &&
          dioError.message.toLowerCase().contains(
              'Can\'t finalize a finalized MultipartFile'.toLowerCase())) {
        try {
          return await _dio.post(
            _buildPath(path: path, apiVersion: apiVersion),
            data: formData,
            options: Options(contentType: "multipart/form-data"),
          );
        } catch (object) {
          throw MultipartFileException(message: dioError.message);
        }
      }

      throw await parseDioError(dioError);
    }
  }

  @override
  Future<Response<T>> put<T>({
    required String path,
    Map<String, dynamic>? body,
    Options? options,
    ApiVersion apiVersion = _defaultApiVersion,
  }) async {
    try {
      return await _dio.put(_buildPath(path: path, apiVersion: apiVersion),
          data: body, options: options);
    } on DioError catch (dioError) {
      throw await parseDioError(dioError);
    }
  }

  int _getConnectTimeout() {
    switch (environment) {
      case Environment.dev:
      case Environment.qa:
        return 5000;
      default:
        return 60000;
    }
  }

  int _getReceiveTimeout() {
    switch (environment) {
      case Environment.dev:
      case Environment.qa:
        return 3000;
      default:
        return 45000;
    }
  }

  @override
  Environment getEnvironment() {
    return environment;
  }
}
