import 'package:flutteronimo/common/services/http/http_service.dart';

import 'http/service_util.dart';

class DealsService {
  final HttpService httpService;

  static const _dealsPath = "/deals";

  DealsService({
    required this.httpService,
  });

  Future<List<String>?> readDealList() async {
    final response = await httpService.get<String>(path: _dealsPath);
    List<dynamic> decodedResponse = ServiceUtil.decodeListResponse(response);
    return decodedResponse.map((e) => ((e['dealRating'] as String) + " - " + (e['title'] as String))).toList();
  }
}
