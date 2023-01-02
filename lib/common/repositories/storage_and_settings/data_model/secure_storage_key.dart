enum SecureStorageKey {
  accessToken,
  refreshToken,
}

extension RawValue on SecureStorageKey {
  // ignore: missing_return
  String get rawValue {
    switch (this) {
      case SecureStorageKey.accessToken:
        return 'accessToken';
      case SecureStorageKey.refreshToken:
        return 'refreshToken';
    }
  }
}
