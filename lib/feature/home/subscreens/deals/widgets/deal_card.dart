// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutteronimo/common/configuration/global_settings.dart';
// import 'package:flutteronimo/common/data_models/deal_item/deal_item.dart';
// import 'package:flutteronimo/common/theme/app_text_style.dart';
//
// class DealCard extends StatefulWidget {
//   final DealItem dealItem;
//   final Function(String) onTap;
//
//   const DealCard({
//     required this.dealItem,
//     required this.onTap,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   _DealCardState createState() => _DealCardState();
// }
//
// class _DealCardState extends State<DealCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
//       child: InkWell(
//         onTap: () => widget.onTap(widget.dealItem.dealID),
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
//           decoration: BoxDecoration(
//             color: Colors.white12,
//             borderRadius: BorderRadius.circular(4.0),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(
//                 flex: 3,
//                 child: _buildGameInfo(),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: _buildRatingComponent(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildRatingComponent() {
//     return Stack(
//       children: [
//         _buildThumbnail(),
//         _buildDealRating(),
//       ],
//     );
//   }
//
//   Widget _buildDealRating() {
//     return Positioned(
//       top: 0,
//       right: 0,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(4.0),
//           color: Colors.black26,
//         ),
//         child: Text(
//           widget.dealItem.dealRating,
//           style: AppTextStyle.bold().copyWith(color: Colors.lightGreen),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildThumbnail() {
//     return Image.network(
//       widget.dealItem.fullThumbnail,
//       height: LayoutSettings.defaultItemHeight,
//       width: 150,
//       fit: BoxFit.fitWidth,
//       alignment: Alignment.center,
//       errorBuilder: (context, error, stackTrace) {
//         return Image.network(
//           widget.dealItem.thumbnail,
//           height: LayoutSettings.defaultItemHeight,
//           width: 150,
//           fit: BoxFit.fitWidth,
//           alignment: Alignment.center,
//         );
//       },
//     );
//   }
//
//   Widget _buildGameInfo() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildGameTitle(),
//         _buildPriceList(),
//       ],
//     );
//   }
//
//   Widget _buildGameTitle() {
//     return Container(
//       child: Text(
//         widget.dealItem.title,
//         style: AppTextStyle.bold(),
//         maxLines: 2,
//         overflow: TextOverflow.ellipsis,
//       ),
//     );
//   }
//
//   Widget _buildPriceList() {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         _buildPastPrice(),
//         const SizedBox(width: 8.0),
//         _buildCurrentPrice(),
//       ],
//     );
//   }
//
//   Widget _buildPastPrice() {
//     return Text(
//       widget.dealItem.normalPrice,
//       style:
//           AppTextStyle.body().copyWith(color: Colors.white38, fontSize: 13.0),
//     );
//   }
//
//   Widget _buildCurrentPrice() {
//     return Text(
//       widget.dealItem.salePrice + " USD",
//       style: AppTextStyle.body().copyWith(fontSize: 15.0),
//     );
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutteronimo/common/data_models/currency/currency.dart';
import 'package:flutteronimo/common/data_models/deal_item/deal_item.dart';
import 'package:flutteronimo/common/theme/app_text_style.dart';
import 'package:flutteronimo/common/utils/helpers/currency_helper.dart';
import 'package:flutteronimo/common/widgets/animations/animated_tap.dart';
import 'package:flutteronimo/feature/home/subscreens/deals/widgets/discount_badge.dart';
import 'package:flutteronimo/feature/home/subscreens/deals/widgets/rating_badge.dart';
import 'package:flutteronimo/gen/colors.gen.dart';

class DealCard extends StatelessWidget {
  final DealItem deal;
  final VoidCallback onDealTap;

  const DealCard({
    super.key,
    required this.deal,
    required this.onDealTap,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTap(
      onTap: () => onDealTap(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
                    imageUrl: deal.fullThumbnail,
                    fit: BoxFit.cover,
                    fadeInDuration: const Duration(milliseconds: 150),
                    placeholder: (context, url) => Container(
                      color: const Color(0xFF1A1A1A),
                    ),
                    errorWidget: (context, url, error) {
                      return CachedNetworkImage(
                        imageUrl: deal.thumbnail,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ColorName.black.withAlpha(150),
                            Colors.transparent,
                            Colors.transparent,
                            ColorName.black.withAlpha(150),
                          ],
                          stops: const [0.0, 0.25, 0.75, 1.0],
                        ),
                      ),
                    ),
                  ),
                  RatingBadge(rating: deal.dealRating),
                  DiscountBadge(discount: discountPercentage),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            deal.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.body2Bold(),
          ),
          const SizedBox(height: 2),
          Text(
            deal.steamAppID != null ? 'Steam' : 'Other',
            style: AppTextStyle.caption2(color: ColorName.white.withAlpha(138)),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(
                CurrencyHelper.formatPrice(
                  deal.salePrice,
                  Currency.usd,
                ),
                style: AppTextStyle.bold(color: ColorName.discountGreen),
              ),
              const SizedBox(width: 8),
              Text(
                CurrencyHelper.formatPrice(
                  deal.normalPrice,
                  Currency.usd,
                ),
                style: AppTextStyle.caption1crossed(
                  color: ColorName.white.withAlpha(97),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  int get discountPercentage {
    final sale = double.tryParse(deal.salePrice.replaceAll('\$', ''));
    final normal = double.tryParse(deal.normalPrice.replaceAll('\$', ''));
    if (sale == null || normal == null || normal == 0) return 0;
    return (((normal - sale) / normal) * 100).round();
  }
}
