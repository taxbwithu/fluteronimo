import 'package:flutter/cupertino.dart';
import 'package:flutteronimo/common/app_router/app_coordinator.dart';
import 'package:flutteronimo/common/data_models/deal_details/deal_details.dart';
import 'package:flutteronimo/common/data_models/deal_item/deal_item.dart';
import 'package:flutteronimo/common/repositories/deals/deals_repository.dart';
import 'package:flutteronimo/common/utils/rx/rx_extensions.dart';
import 'package:rxdart/rxdart.dart';

class DealDetailsVm {
  final DealsRepository dealsRepository;
  final screenContentSubject = BehaviorSubject<DealDetails?>.seeded(null);
  final _appCoordinator = AppCoordinator();

  DealDetailsVm({
    required this.dealsRepository,
  });

  Future loadScreenData({
    required String dealId,
  }) async {
    try {
      final serverData = await dealsRepository.readDealDetails(dealId: dealId);
      print("done");
      screenContentSubject.addSafe(serverData);
    } catch (object) {
      // TODO replace with error handling
      print(object);
    }
  }

  void closeScreen({
    required BuildContext context,
  }) {
    _appCoordinator.popLast(context: context);
  }

  void dispose() {
    screenContentSubject.close();
  }
}
