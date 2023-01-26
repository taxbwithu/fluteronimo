// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GameInfo _$$_GameInfoFromJson(Map<String, dynamic> json) => _$_GameInfo(
      storeID: json['storeID'] as String?,
      gameID: json['gameID'] as String?,
      name: json['name'] as String?,
      steamAppID: json['steamAppID'] as String?,
      salePrice: json['salePrice'] as String?,
      retailPrice: json['retailPrice'] as String?,
      steamRatingText: json['steamRatingText'] as String?,
      steamRatingPercent: json['steamRatingPercent'] as String?,
      metacriticScore: json['metacriticScore'] as String?,
      releaseDate: _timestampToDate(json['releaseDate'] as int),
      publisher: json['publisher'] as String?,
      thumb: json['thumb'] as String?,
    );

Map<String, dynamic> _$$_GameInfoToJson(_$_GameInfo instance) =>
    <String, dynamic>{
      'storeID': instance.storeID,
      'gameID': instance.gameID,
      'name': instance.name,
      'steamAppID': instance.steamAppID,
      'salePrice': instance.salePrice,
      'retailPrice': instance.retailPrice,
      'steamRatingText': instance.steamRatingText,
      'steamRatingPercent': instance.steamRatingPercent,
      'metacriticScore': instance.metacriticScore,
      'releaseDate': instance.releaseDate?.toIso8601String(),
      'publisher': instance.publisher,
      'thumb': instance.thumb,
    };
