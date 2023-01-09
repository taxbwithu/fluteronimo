import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          color: Colors.white30,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildThumbnail(),
            _buildGameTitle(),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    return Image.network(
      widget.dealItem.thumb,
      width: double.infinity,
      height: 100,
      fit: BoxFit.fitWidth,
      alignment: Alignment.topCenter,
    );
  }

  Widget _buildGameTitle() {
    return Container(
      width: double.infinity,
      child: Text(
        widget.dealItem.title,
        style: AppTextStyle.body(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
