import 'package:flutteronimo/common/repositories/deals/deals_repository.dart';
import 'package:flutteronimo/common/utils/extensions/iterable_extensions.dart';

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
    final refList = dealItems;
    List<DealItem> list = [];
    if (refList == null) {
      return null;
    }
    for (var item in refList) {
      if (list.firstWhereOrNull((e) => e.title == item.title) != null){
        continue;
      }
      final bestDeal = refList
          .where((element) => element.title == item.title)
          .reduce((curr, next) =>
              double.parse(curr.salePrice) < double.parse(next.salePrice)
                  ? curr
                  : next);
      list.add(bestDeal);
    }
    return list;
  }

}
