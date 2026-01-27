import 'package:flutteronimo/common/data_models/deal_item/ws/deal_item_ws.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@freezed
class DealItem {
  final String dealID;
  final String title;
  final String salePrice;
  final String normalPrice;
  final String? steamAppID;
  final String dealRating;
  final String thumbnail;
  final String fullThumbnail;

  DealItem({
    required this.dealID,
    required this.title,
    required this.salePrice,
    required this.normalPrice,
    required this.steamAppID,
    required this.dealRating,
    required this.thumbnail,
    required this.fullThumbnail,
  });

  factory DealItem.fromWsData(DealItemWs wsData) {
    return DealItem(
      dealID: wsData.dealID,
      title: wsData.title,
      salePrice: wsData.salePrice,
      normalPrice: wsData.normalPrice,
      steamAppID: wsData.steamAppID,
      dealRating: wsData.dealRating,
      thumbnail: wsData.thumb,
      fullThumbnail: toSteamHeader(
        steamAppID: wsData.steamAppID,
        thumb: wsData.thumb,
      ),
    );
  }

  static String toSteamHeader({
    required String? steamAppID,
    required String thumb,
  }) {
    if (steamAppID == null) return thumb;
    return 'https://cdn.cloudflare.steamstatic.com/steam/apps/$steamAppID/library_600x900.jpg';
  }
}
