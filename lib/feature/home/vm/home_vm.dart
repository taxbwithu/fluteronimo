import 'package:flutteronimo/common/data_models/deal_item/deal_item.dart';
import 'package:flutteronimo/common/repositories/deals/deals_repository.dart';
import 'package:flutteronimo/common/utils/rx/rx_extensions.dart';
import 'package:rxdart/rxdart.dart';

class HomeVm {
  final DealsRepository dealsRepository;
  final screenContentSubject = BehaviorSubject<List<DealItem>?>.seeded(null);

  HomeVm({
    required this.dealsRepository,
  });

  Future loadScreenData() async {
    try {
      final result = await dealsRepository.readDealList();
      print("done");
      screenContentSubject.addSafe(result);
    } catch (object) {
      // TODO replace with error handling
      print(object);
    }
  }

  void dispose() {
    screenContentSubject.close();
  }
}
