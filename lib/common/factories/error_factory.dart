import 'dart:convert';

import 'package:dio/dio.dart';

import '../data_models/exceptions/general_exception.dart';
import '../data_models/exceptions/webservice_exception.dart';
import '../data_models/webservice/webservice_error.dart';

class ErrorFactory {
  static Future<Exception> convertServerError(Response? response) async {
    if (response == null) {
      return Future.value(GeneralException());
    }

    final body = await _getBodyJson(response);
    final webserviceError = WebserviceError.fromJson(body);

    final webserviceException = WebserviceException(
      error: webserviceError,
      httpCode: response.statusCode,
    );
    return Future.value(webserviceException);
  }

  static Exception toException(Object object) {
    if (object is Exception) {
      return object;
    }
    return GeneralException();
  }

  static Future<Map<String, dynamic>> _getBodyJson(Response response) async {
    if (response.data is Map<String, dynamic>) {
      return Future.value(response.data as Map<String, dynamic>);
    } else if (response.data is String) {
      final json =
          await jsonDecode(response.data as String) as Map<String, dynamic>;
      return Future.value(json);
    }
    return Future.value(<String, dynamic>{});
  }
}
