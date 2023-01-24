// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DealDetails _$$_DealDetailsFromJson(Map<String, dynamic> json) =>
    _$_DealDetails(
      storeID: GameInfo.fromJson(json['gameInfo'] as Map<String, dynamic>),
      gameID:
          CheapestPrice.fromJson(json['cheapestPrice'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DealDetailsToJson(_$_DealDetails instance) =>
    <String, dynamic>{
      'gameInfo': instance.storeID.toJson(),
      'cheapestPrice': instance.gameID.toJson(),
    };
