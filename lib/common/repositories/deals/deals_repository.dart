import 'package:flutteronimo/common/data_models/deal_details/deal_details.dart';

import '../../data_models/deal_details/ws/deal_details_ws.dart';
import '../../data_models/deal_item/deal_item.dart';

abstract class DealsRepository {
  Future<List<DealItem>?> readDealList({
    required int currentPage,
  });

  Future<DealDetails> readDealDetails({
    required String dealId,
  });
}
