import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_data.freezed.dart';

part 'store_data.g.dart';

DateTime? _timestampToDate(int timestamp) => timestamp == 0 ? null : DateTime.fromMillisecondsSinceEpoch(timestamp * 1000000);

@freezed
class StoreData with _$StoreData {
  @JsonSerializable(explicitToJson: true)
  const factory StoreData({
    @JsonKey(name: "storeID") required String storeID,
    @JsonKey(name: "storeName") required String storeName,
  }) = _StoreData;

  factory StoreData.fromJson(Map<String, Object?> json) =>
      _$StoreDataFromJson(json);

}