import 'package:flutteronimo/common/data_models/game_info/ws/game_info_ws.dart';

class GameInfo {
  final String? storeID;
  final String? gameID;
  final String? name;
  final String? steamAppID;
  final String? salePrice;
  final String? retailPrice;
  final String? steamRatingText;
  final String? steamRatingPercent;
  final String? metacriticScore;
  final DateTime? releaseDate;
  final String? publisher;
  final String? thumbnail;
  final String? thumbnailFull;

  GameInfo({
    required this.storeID,
    required this.gameID,
    required this.name,
    required this.steamAppID,
    required this.salePrice,
    required this.retailPrice,
    required this.steamRatingText,
    required this.steamRatingPercent,
    required this.metacriticScore,
    required this.releaseDate,
    required this.publisher,
    required this.thumbnail,
    required this.thumbnailFull,
  });

  factory GameInfo.fromWsData(GameInfoWs wsData) {
    return GameInfo(
      storeID: wsData.storeID,
      gameID: wsData.gameID,
      name: wsData.name,
      steamAppID: wsData.steamAppID,
      salePrice: wsData.salePrice,
      retailPrice: wsData.retailPrice,
      steamRatingText: wsData.steamRatingText,
      steamRatingPercent: wsData.steamRatingPercent,
      metacriticScore: wsData.metacriticScore,
      releaseDate: wsData.releaseDate,
      publisher: wsData.publisher,
      thumbnail: wsData.thumb,
      thumbnailFull: toSteamHeader(
        steamAppID: wsData.steamAppID,
        thumb: wsData.thumb,
      ),
    );
  }

  static String? toSteamHeader({
    required String? steamAppID,
    required String? thumb,
  }) {
    if (steamAppID == null || steamAppID.isEmpty) return thumb;
    return 'https://cdn.cloudflare.steamstatic.com/steam/apps/$steamAppID/library_600x900.jpg';
  }
}
