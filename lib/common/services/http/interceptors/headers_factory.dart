import 'dart:io';

class HeadersFactory {
  Map<String, String> makeAuthorization(String accessToken) {
    if (accessToken.isNotEmpty) {
      return {HttpHeaders.authorizationHeader: "Bearer $accessToken"};
    }
    return {};
  }

  Map<String, String> makeAcceptLanguage(String language) {
    return {HttpHeaders.acceptLanguageHeader: language};
  }

  Map<String, String> makeSecurityHeader() {
    return {"Security-Header": const String.fromEnvironment('API_KEY')};
  }
}
