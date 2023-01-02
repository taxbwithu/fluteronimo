
import 'package:dio/dio.dart';

import '../../../app/environment.dart';
import 'api_version.dart';
import 'base_service.dart';

abstract class HttpService extends BaseService {
  Environment getEnvironment();

  Future<Response<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    ApiVersion apiVersion,
  });

  Future<Response<T>> post<T>({
    required String path,
    Map<String, dynamic>? body,
    ApiVersion apiVersion,
    Options? options,
  });

  Future<Response<T>> postMultipart<T>({
    required String path,
    FormData? formData,
    ApiVersion apiVersion,
  });

  Future<Response<T>> put<T>({
    required String path,
    Map<String, dynamic>? body,
    ApiVersion apiVersion,
    Options? options,
  });

  Future<Response<T>> patch<T>({
    required String path,
    Map<String, dynamic>? body,
    ApiVersion apiVersion,
  });

  Future<Response<T>> delete<T>({
    required String path,
    Map<String, String>? body,
    ApiVersion apiVersion,
  });
}
