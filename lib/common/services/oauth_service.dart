import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../app/environment.dart';
import '../data_models/account_data/tokens.dart';
import '../data_models/exceptions/revoke_token_exception.dart';
import '../repositories/storage_and_settings/system_secure_storage.dart';
import '../utils/logger/logger.dart';
import 'base_url.dart';
import 'http/api_version.dart';

class OAuthService {
  final String _refreshPath = "/oauth/refresh-token";
  final SystemSecureStorage storageService;
  final Environment environment;

  static const ApiVersion _defaultApiVersion = ApiVersion.v1;

  OAuthService({
    required this.storageService,
    required this.environment,
  });

  Future<bool> refreshAndSave(
      {ApiVersion apiVersion = _defaultApiVersion}) async {
    try {
      final data = await refreshToken(apiVersion: apiVersion);
      await storageService.saveTokens(
        accessToken: data.accessToken,
        refreshToken: data.refreshToken,
      );

      return Future.value(true);
    } catch (exception, stackTrace) {
      Logger().error("Failed to refresh token", trace: stackTrace);
      return Future.value(false);
    }
  }

  String _buildPath({required String path, required ApiVersion apiVersion}) {
    return "/${describeEnum(apiVersion)}$path";
  }

  Future<Tokens> refreshToken({
    ApiVersion apiVersion = _defaultApiVersion,
  }) async {
    final refreshToken = await storageService.readRefreshToken();
    await storageService.removeAccessToken();
    final baseUrl = BaseUrl.make(environment);
    final path = _buildPath(path: _refreshPath, apiVersion: apiVersion);
    final url = "$baseUrl$path";
    var client = http.Client();
    try {
      final uri = Uri.parse(url);
      //TODO 02.01.2022 add refreshing token in the future
      final body = {};
      final response = await client.post(
        uri,
        body: body,
      );
      if (response.statusCode == 401) {
        return Future.error(RevokeTokenException(
          message: 'HTTP 401',
          options: RequestOptions(path: path),
        ));
      } else if (response.statusCode == 400) {
        return Future.error(RevokeTokenException(
          message: 'HTTP 401',
          options: RequestOptions(path: path),
        ));
      }
      return _getResponseTokens(response);
    } finally {
      client.close();
    }
  }

  Tokens _getResponseTokens(http.Response response) {
    final jsonBody = json.decode(response.body) as Map<String, dynamic>;
    return Tokens(
      refreshToken: jsonBody["refresh_token"] as String,
      accessToken: jsonBody["access_token"] as String,
    );
  }
}
