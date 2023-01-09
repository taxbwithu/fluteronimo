import 'package:freezed_annotation/freezed_annotation.dart';

part 'deal_item.freezed.dart';

part 'deal_item.g.dart';

@freezed
class DealItem with _$DealItem {
  const factory DealItem({
    required String dealID,
    required String title,
    required String salePrice,
    required String normalPrice,
    required String dealRating,
    required String thumb,
  }) = _DealItem;

  factory DealItem.fromJson(Map<String, Object?> json) =>
      _$DealItemFromJson(json);
}
