enum SharedPreferenceKey {
  preferredLanguage
}

extension RawValue on SharedPreferenceKey {
  // ignore: missing_return
  String get rawValue {
    switch(this) {
      case SharedPreferenceKey.preferredLanguage:
        return "preferredLanguage";
    }
  }
}
