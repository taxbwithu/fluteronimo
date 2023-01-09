import 'package:flutteronimo/common/repositories/deals/deals_repository.dart';

import '../../data_models/deal_item/deal_item.dart';
import '../../services/deals_service.dart';

class StubDealsRepository extends DealsRepository {
  final DealsService service;

  StubDealsRepository({
    required this.service,
  });

  //TODO replace with pagination
  @override
  Future<List<DealItem>?> readDealList() async {
    final items = await service.readDealList();
    return filterByTitle(dealItems: items);
  }

  //TODO check implementation
  List<DealItem>? filterByTitle({
    required List<DealItem>? dealItems,
  }) {
    final items = dealItems;
    List<DealItem> list = [];
    if (items == null) {
      return null;
    }
    for (var item in items) {
      final bestDeal = items.where((element) => element.title == item.title).reduce((curr, next) => double.parse(curr.salePrice) < double.parse(next.salePrice)? curr: next);
      items.removeWhere((element) => element.title == bestDeal.title);
      list.add(bestDeal);
    }
    return list;
  }
}
