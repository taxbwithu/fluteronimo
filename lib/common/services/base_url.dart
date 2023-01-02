import '../../app/environment.dart';

class BaseUrl {
  // ignore: missing_return
  static String make(Environment environment) {
    switch (environment) {
      case Environment.dev:
        return "https://www.cheapshark.com/api/";
      case Environment.qa:
        return "https://www.cheapshark.com/api/";
      case Environment.uat:
        return "https://www.cheapshark.com/api/";
      case Environment.prod:
        return "https://www.cheapshark.com/api/";
    }
  }
}
