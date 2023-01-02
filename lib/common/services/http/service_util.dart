import 'dart:convert';

import 'package:dio/dio.dart';

import '../../data_models/webservice/pagination/paginated_data.dart';
import '../../data_models/webservice/pagination/paginated_response_ws.dart';


class ServiceUtil {
  static const pageSize = 10;

  static bool isResponseSuccess(Response? response) {
    final statusCode = response?.statusCode;
    if (statusCode == null) {
      return false;
    }
    return 200 <= statusCode && statusCode <= 300;
  }

  static bool ifBadRequest(Response? response) {
    final statusCode = response?.statusCode;
    if (statusCode == null) {
      return false;
    }
    return 400 <= statusCode;
  }

  static Map<String, dynamic> decodeResponse(Response response) {
    final String input = response.data as String;
    return json.decode(input) as Map<String, dynamic>;
  }

  static List<Map<String, dynamic>> decodeArrayResponse(Response response) {
    final String input = response.data as String;
    return json.decode(input) as List<Map<String, dynamic>>;
  }

  static List<dynamic> decodeListResponse(Response response) {
    final String input = response.data as String;
    return json.decode(input) as List<dynamic>;
  }

  static void buildParam(Map<String, dynamic> map, String key, Object? value) {
    if (value != null) {
      map[key] = value.toString();
    }
  }

  static void buildRawParam(
    Map<String, dynamic> map,
    String key,
    Object? value,
  ) {
    if (value != null) {
      map[key] = value;
    }
  }

  static void buildListParam<T>({
    required Map<String, dynamic> map,
    required String key,
    required List<T>? items,
  }) {
    if (items == null || items.isEmpty) {
      return;
    }
    map["$key[]"] = items;
  }

  static void buildDateParam({
    required Map<String, dynamic> map,
    required String key,
    required DateTime? dateTime,
  }) {
    if (dateTime != null) {
      final value = dateTime.toUtc().toIso8601String();
      buildParam(map, key, value);
    }
  }

  static PaginatedData<T> parseRequest<T>({
    required Response<String> response,
    required List<T> Function(PaginatedResponseWs) parser,
  }) {
    final decodedResponse = decodeResponse(response);
    final paginatedResponse = PaginatedResponseWs.fromJson(decodedResponse);
    return PaginatedData<T>(
      paginationData: paginatedResponse.paginationData,
      items: parser(paginatedResponse),
    );
  }

  static Map<String, dynamic> getPaginationParams({
    required int page,
    int limit = pageSize,
  }) {
    return <String, dynamic>{
      'page': page,
      'limit': limit,
    };
  }

  static FormData? buildMultipartParam({
    required String data,
    required List<int>? fileInBytes,
    required String fileName,
  }) {
    MultipartFile? multipart;
    if (fileInBytes == null || fileInBytes.isEmpty) {
      multipart = null;
    } else {
      multipart = MultipartFile.fromBytes(fileInBytes, filename: fileName);
    }
    return FormData.fromMap(<String, dynamic>{
      "json": data,
      "image": multipart,
    });
  }
}
