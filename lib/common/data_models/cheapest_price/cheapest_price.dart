import 'package:freezed_annotation/freezed_annotation.dart';

part 'cheapest_price.freezed.dart';

part 'cheapest_price.g.dart';

DateTime? _timestampToDate(int timestamp) => timestamp == 0 ? null : DateTime.fromMillisecondsSinceEpoch(timestamp * 1000000);

@freezed
class CheapestPrice with _$CheapestPrice {
  @JsonSerializable(explicitToJson: true)
  const factory CheapestPrice({
    @JsonKey(name: "price") required String? cheapestPrice,
    @JsonKey(name: "date", fromJson: _timestampToDate) required DateTime? cheapestPriceDate,
  }) = _CheapestPrice;

  factory CheapestPrice.fromJson(Map<String, Object?> json) =>
      _$CheapestPriceFromJson(json);
  
}
