import 'package:freezed_annotation/freezed_annotation.dart';

part 'deal_item_ws.freezed.dart';

part 'deal_item_ws.g.dart';

@freezed
class DealItemWs with _$DealItemWs {
  factory DealItemWs({
    required String dealID,
    required String title,
    required String salePrice,
    required String normalPrice,
    required String? steamAppID,
    required String dealRating,
    required String thumb,
  }) = _DealItemWs;

  factory DealItemWs.fromJson(Map<String, Object?> json) =>
      _$DealItemWsFromJson(json);
}
