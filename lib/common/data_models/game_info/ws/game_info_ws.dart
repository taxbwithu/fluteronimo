import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_info_ws.freezed.dart';

part 'game_info_ws.g.dart';

DateTime? _timestampToDate(int timestamp) => timestamp == 0 ? null : DateTime.fromMillisecondsSinceEpoch(timestamp * 1000000);

@freezed
class GameInfoWs with _$GameInfoWs {
  @JsonSerializable(explicitToJson: true)
  const factory GameInfoWs({
    @JsonKey(name: "storeID") required String? storeID,
    @JsonKey(name: "gameID") required String? gameID,
    @JsonKey(name: "name") required String? name,
    @JsonKey(name: "steamAppID") required String? steamAppID,
    @JsonKey(name: "salePrice") required String? salePrice,
    @JsonKey(name: "retailPrice") required String? retailPrice,
    @JsonKey(name: "steamRatingText") required String? steamRatingText,
    @JsonKey(name: "steamRatingPercent") required String? steamRatingPercent,
    @JsonKey(name: "metacriticScore") required String? metacriticScore,
    @JsonKey(name: "releaseDate", fromJson: _timestampToDate) required DateTime? releaseDate,
    @JsonKey(name: "publisher") required String? publisher,
    @JsonKey(name: "thumb") required String? thumb,
  }) = _GameInfoWs;

  factory GameInfoWs.fromJson(Map<String, Object?> json) =>
      _$GameInfoWsFromJson(json);
  
}
