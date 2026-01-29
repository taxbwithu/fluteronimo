import 'package:flutteronimo/common/data_models/deal_details/deal_details.dart';
import 'package:flutteronimo/common/data_models/deal_item/ws/deal_item_ws.dart';
import 'package:flutteronimo/common/services/http/http_service.dart';
import 'package:flutteronimo/common/utils/list/list_extension.dart';

import '../data_models/deal_item/deal_item.dart';
import 'http/service_util.dart';

class DealsService {
  final HttpService httpService;

  static const _dealsPath = "/deals";

  DealsService({
    required this.httpService,
  });

  Future<List<DealItemWs>?> readDealList({
    required int currentPage,
  }) async {
    final response = await httpService.get<String>(
      path: _dealsPath,
      queryParameters: {
        "pageNumber": currentPage,
      },
    );
    List<dynamic> decodedResponse = ServiceUtil.decodeListResponse(response);
    return decodedResponse.map((e) => DealItemWs.fromJson(e)).toList();
  }

  Future<DealDetails> readDealDetails({
    required String dealId,
  }) async {
    final response =
        await httpService.get<String>(path: _dealsPath + "?id=$dealId");
    dynamic decodedResponse = ServiceUtil.decodeResponse(response);
    return DealDetails.fromJson(decodedResponse);
  }
}
