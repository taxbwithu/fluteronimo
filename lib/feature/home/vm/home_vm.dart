import 'package:flutter/cupertino.dart';
import 'package:flutteronimo/common/app_router/app_coordinator.dart';
import 'package:flutteronimo/common/data_models/deal_item/deal_item.dart';
import 'package:flutteronimo/common/repositories/deals/deals_repository.dart';
import 'package:flutteronimo/common/repositories/stores/stores_repository.dart';
import 'package:flutteronimo/common/utils/rx/rx_extensions.dart';
import 'package:rxdart/rxdart.dart';

class HomeVm {
  final DealsRepository dealsRepository;
  final StoresRepository storesRepository;
  final screenContentSubject = BehaviorSubject<List<DealItem>?>.seeded(null);
  final _appCoordinator = AppCoordinator();

  HomeVm({
    required this.dealsRepository,
    required this.storesRepository,
  });

  Future loadScreenData() async {
    try {
      final result = await dealsRepository.readDealList();
      await storesRepository.saveStoreList();
      print("done");
      screenContentSubject.addSafe(result);
    } catch (object) {
      // TODO replace with error handling
      print(object);
    }
  }

  void openDealDetails({
    required BuildContext context,
    required String dealId,
  }) {
    _appCoordinator.navigateToDealDetails(context: context, dealId: dealId);
  }

  void dispose() {
    screenContentSubject.close();
  }
}
