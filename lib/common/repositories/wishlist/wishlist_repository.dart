import 'package:flutteronimo/common/data_models/deal_details/deal_details.dart';

abstract class WishlistRepository {
  Future<List<DealDetails>?> readWishlist();

  Future saveWishlistItem({
    required DealDetails dealDetails,
  });
}