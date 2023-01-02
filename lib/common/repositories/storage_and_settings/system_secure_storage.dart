import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'data_model/secure_storage_key.dart';

class SystemSecureStorage {
  final FlutterSecureStorage storage;

  SystemSecureStorage({
    required this.storage,
  });

  Future<void> deleteAll() async {
    return await storage.deleteAll();
  }

  Future<void> save({
    required String value,
    required SecureStorageKey forKey,
  }) async {
    return await storage.write(key: forKey.rawValue, value: value);
  }

  Future<String?> readValue({
    required SecureStorageKey forKey,
  }) async {
    return await storage.read(key: forKey.rawValue);
  }

  final _accessTokenKey = SecureStorageKey.accessToken.rawValue;
  final _refreshTokenKey = SecureStorageKey.refreshToken.rawValue;

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await saveAccessToken(accessToken);
    return storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  Future<String?> readAccessToken() async {
    return await storage.read(key: _accessTokenKey);
  }

  Future saveAccessToken(String accessToken) async {
    storage.write(key: _accessTokenKey, value: accessToken);
  }

  Future<String?> readRefreshToken() async {
    return await storage.read(key: _refreshTokenKey);
  }

  Future<void> removeTokens() async {
    await storage.delete(key: _refreshTokenKey);
    return await storage.delete(key: _accessTokenKey);
  }

  Future<void> removeAccessToken() async {
    return await storage.delete(key: _accessTokenKey);
  }
}
