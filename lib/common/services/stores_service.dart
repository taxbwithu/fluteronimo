import 'package:flutteronimo/common/data_models/store_data/store_data.dart';

import 'http/http_service.dart';
import 'http/service_util.dart';

class StoresService {
  final HttpService httpService;

  static const _storePath = "/stores";

  StoresService({
    required this.httpService,
  });

  Future<List<StoreData>> readStoreList() async {
    final response = await httpService.get<String>(path: _storePath);
    List<dynamic> decodedResponse = ServiceUtil.decodeListResponse(response);
    return decodedResponse.map((e) => StoreData.fromJson(e)).toList();
  }

}