import 'package:flutteronimo/common/data_models/cheapest_price/cheapest_price.dart';
import 'package:flutteronimo/common/data_models/game_info/game_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deal_details.freezed.dart';

part 'deal_details.g.dart';

@freezed
class DealDetails with _$DealDetails {
  @JsonSerializable(explicitToJson: true)
  const factory DealDetails({
    @JsonKey(name: "gameInfo") required GameInfo storeID,
    @JsonKey(name: "cheapestPrice") required CheapestPrice gameID,
  }) = _DealDetails;

  factory DealDetails.fromJson(Map<String, Object?> json) =>
      _$DealDetailsFromJson(json);
  
}
