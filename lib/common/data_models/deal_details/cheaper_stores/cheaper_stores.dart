import 'package:freezed_annotation/freezed_annotation.dart';

part 'cheaper_stores.freezed.dart';

part 'cheaper_stores.g.dart';

@freezed
class CheaperStores with _$CheaperStores {
  @JsonSerializable(explicitToJson: true)
  const factory CheaperStores({
    @JsonKey(name: "dealID") required String? dealID,
    @JsonKey(name: "storeID") required String? storeID,
    @JsonKey(name: "salePrice") required String? salePrice,
    @JsonKey(name: "retailPrice") required String? retailPrice,
  }) = _CheaperStores;

  factory CheaperStores.fromJson(Map<String, Object?> json) =>
      _$CheaperStoresFromJson(json);

}