import 'package:flutteronimo/common/data_models/deal_details/deal_details.dart';
import 'package:flutteronimo/common/data_models/deal_details/ws/deal_details_ws.dart';

abstract class WishlistRepository {
  Future<List<DealDetails>?> readWishlist();

  Future saveWishlistItem({
    required DealDetails dealDetails,
  });
}