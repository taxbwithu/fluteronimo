import 'package:flutteronimo/common/data_models/cheapest_price/cheapest_price.dart';
import 'package:flutteronimo/common/data_models/deal_details/cheaper_stores/cheaper_stores.dart';
import 'package:flutteronimo/common/data_models/deal_details/ws/deal_details_ws.dart';
import 'package:flutteronimo/common/data_models/game_info/game_info.dart';

class DealDetails {
  final GameInfo gameInfo;
  final CheapestPrice cheapestPrice;
  final List<CheaperStores> cheaperStores;

  DealDetails({
    required this.gameInfo,
    required this.cheapestPrice,
    required this.cheaperStores,
  });

  factory DealDetails.fromWsData(DealDetailsWs wsData) {
    return DealDetails(
      gameInfo: GameInfo.fromWsData(wsData.gameInfo),
      cheapestPrice: wsData.cheapestPrice,
      cheaperStores: wsData.cheaperStores,
    );
  }
}
