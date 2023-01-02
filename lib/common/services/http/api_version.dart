enum ApiVersion { v1 }

extension API on ApiVersion {
  String get apiString {
    switch(this) {
      case ApiVersion.v1:
        return "1.0";
    }
}
}