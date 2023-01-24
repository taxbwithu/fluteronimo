// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cheapest_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CheapestPrice _$$_CheapestPriceFromJson(Map<String, dynamic> json) =>
    _$_CheapestPrice(
      cheapestPrice: json['price'] as String?,
      cheapestPriceDate: _timestampToDate(json['date'] as int),
    );

Map<String, dynamic> _$$_CheapestPriceToJson(_$_CheapestPrice instance) =>
    <String, dynamic>{
      'price': instance.cheapestPrice,
      'date': instance.cheapestPriceDate?.toIso8601String(),
    };
