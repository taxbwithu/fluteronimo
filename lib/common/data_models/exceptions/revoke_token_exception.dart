import 'package:dio/dio.dart';

import 'general_exception.dart';

class RevokeTokenException extends DioError implements GeneralException {
  @override
  final String message;
  final RequestOptions? options;

  RevokeTokenException({
    required this.message,
    required this.options,
  }) : super(requestOptions: options ?? RequestOptions(path: ''));
}
