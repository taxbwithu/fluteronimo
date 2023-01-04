import 'package:flutteronimo/common/repositories/deals/deals_repository.dart';
import 'package:flutteronimo/common/utils/rx/rx_extensions.dart';
import 'package:rxdart/rxdart.dart';

class HomeVm {
  final DealsRepository dealsRepository;
  final screenContentSubject = BehaviorSubject<List<String>?>.seeded(null);

  HomeVm({
    required this.dealsRepository,
  });

  Future loadScreenData() async {
    try {
      final result = await dealsRepository.readDealList();
      screenContentSubject.addSafe(result);
    } catch (object) {
      // TODO replace with error handling
      print(object);
    }
  }
}
