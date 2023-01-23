import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteronimo/common/configuration/global_settings.dart';
import 'package:flutteronimo/common/data_models/deal_item/deal_item.dart';
import 'package:flutteronimo/common/theme/app_text_style.dart';

class DealCard extends StatefulWidget {
  final DealItem dealItem;

  const DealCard({
    required this.dealItem,
    Key? key,
  }) : super(key: key);

  @override
  _DealCardState createState() => _DealCardState();
}

class _DealCardState extends State<DealCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: _buildGameInfo(),
            ),
            Expanded(
              flex: 1,
              child: _buildRatingComponent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingComponent() {
    return Stack(
      children: [
        _buildThumbnail(),
        _buildDealRating(),
      ],
    );
  }

  Widget _buildDealRating() {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: Colors.black26,
        ),
        child: Text(
          widget.dealItem.dealRating,
          style: AppTextStyle.bold().copyWith(color: Colors.lightGreen),
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    return Image.network(
      widget.dealItem.thumb,
      height: LayoutSettings.defaultItemHeight,
      width: 150,
      fit: BoxFit.fitWidth,
      alignment: Alignment.center,
    );
  }

  Widget _buildGameInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildGameTitle(),
        _buildPriceList(),
      ],
    );
  }

  Widget _buildGameTitle() {
    return Container(
      child: Text(
        widget.dealItem.title,
        style: AppTextStyle.bold(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildPriceList() {
    return Row(crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildPastPrice(),
        const SizedBox(width: 8.0),
        _buildCurrentPrice(),
      ],
    );
  }

  Widget _buildPastPrice() {
    return Text(widget.dealItem.normalPrice, style: AppTextStyle.body().copyWith(color: Colors.white38, fontSize: 13.0),);
  }
  Widget _buildCurrentPrice() {
    return Text(widget.dealItem.salePrice + " USD", style: AppTextStyle.body().copyWith(fontSize: 15.0),);
  }
}
