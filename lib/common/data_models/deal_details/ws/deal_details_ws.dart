import 'package:flutteronimo/common/data_models/cheapest_price/cheapest_price.dart';
import 'package:flutteronimo/common/data_models/deal_details/cheaper_stores/cheaper_stores.dart';
import 'package:flutteronimo/common/data_models/game_info/ws/game_info_ws.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deal_details_ws.freezed.dart';

part 'deal_details_ws.g.dart';

@freezed
class DealDetailsWs with _$DealDetailsWs {
  @JsonSerializable(explicitToJson: true)
  const factory DealDetailsWs({
    @JsonKey(name: "gameInfo") required GameInfoWs gameInfo,
    @JsonKey(name: "cheapestPrice") required CheapestPrice cheapestPrice,
    @JsonKey(name: "cheaperStores") required List<CheaperStores> cheaperStores,
  }) = _DealDetailsWs;

  factory DealDetailsWs.fromJson(Map<String, Object?> json) =>
      _$DealDetailsWsFromJson(json);
  
}
