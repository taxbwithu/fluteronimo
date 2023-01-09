// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DealItem _$$_DealItemFromJson(Map<String, dynamic> json) => _$_DealItem(
      dealID: json['dealID'] as String,
      title: json['title'] as String,
      salePrice: json['salePrice'] as String,
      normalPrice: json['normalPrice'] as String,
      dealRating: json['dealRating'] as String,
      thumb: json['thumb'] as String,
    );

Map<String, dynamic> _$$_DealItemToJson(_$_DealItem instance) =>
    <String, dynamic>{
      'dealID': instance.dealID,
      'title': instance.title,
      'salePrice': instance.salePrice,
      'normalPrice': instance.normalPrice,
      'dealRating': instance.dealRating,
      'thumb': instance.thumb,
    };
