import 'package:flutteronimo/common/services/http/http_service.dart';

class DealsService {
  final HttpService httpService;

  static const _dealsPath = "/deals";

  DealsService({
    required this.httpService,
  });
}
