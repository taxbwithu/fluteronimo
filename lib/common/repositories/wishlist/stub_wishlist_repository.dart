import 'package:flutteronimo/common/data_models/deal_details/deal_details.dart';
import 'package:flutteronimo/common/data_models/deal_details/ws/deal_details_ws.dart';
import 'package:flutteronimo/common/data_models/game_info/ws/game_info_ws.dart';
import 'package:flutteronimo/common/database/database_helper.dart';
import 'package:flutteronimo/common/repositories/deals/deals_repository.dart';
import 'package:flutteronimo/common/repositories/wishlist/wishlist_repository.dart';
import 'package:flutteronimo/common/utils/extensions/iterable_extensions.dart';

import '../../data_models/cheapest_price/cheapest_price.dart';
import '../../data_models/deal_item/deal_item.dart';
import '../../services/deals_service.dart';

class StubWishlistRepository extends WishlistRepository {
  final DatabaseHelper database;

  StubWishlistRepository({
    required this.database,
  });

  //TODO replace with pagination
  @override
  Future<List<DealDetails>?> readWishlist() async {
    return null;
  
    // final items = await service.readDealList();
    // return filterByTitle(dealItems: items);
  }

  @override
  Future<DealDetails?> readDealDetails({
    required String dealId,
  }) async {
    /*return DealDetails(
      gameInfo: GameInfo(
        storeID: '1',
        gameID: '123',
        name: 'Mock Game',
        steamAppID: '456',
        salePrice: '19.99',
        retailPrice: '59.99',
        steamRatingText: 'Very Positive',
        steamRatingPercent: '95',
        metacriticScore: '88',
        releaseDate: DateTime.now(),
        publisher: 'Mock Publisher',
        thumb: 'https://via.placeholder.com/150',
      ),
      cheapestPrice: CheapestPrice(
        cheapestPrice: '9.99',
        cheapestPriceDate: DateTime.now(),
      ),
    );*/
    // return service.readDealDetails(dealId: dealId);
  }

  @override
  Future<dynamic> saveWishlistItem({required DealDetails dealDetails}) {
    // TODO: implement saveWishlistItem
    throw UnimplementedError();
  }
  
}
