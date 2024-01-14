import 'package:flutteronimo/common/data_models/deal_item/deal_item.dart';

class WishlistStates {}

class InitialState extends WishlistStates {}

class UpdateState extends WishlistStates {
  final List<DealItem> dealList;
  UpdateState(this.dealList);
}