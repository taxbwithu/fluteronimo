import '../../data_models/deal_details/deal_details.dart';
import '../../data_models/deal_item/deal_item.dart';

abstract class DealsRepository {
  //TODO add pagination
  Future<List<DealItem>?> readDealList();

  Future<DealDetails> readDealDetails({
    required String dealId,
  });
}