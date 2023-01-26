import 'package:flutter/material.dart';
import 'package:flutteronimo/common/data_models/deal_details/deal_details.dart';
import 'package:flutteronimo/common/theme/app_text_style.dart';
import 'package:flutteronimo/generated/l10n.dart';

class DealDetailsCard extends StatefulWidget {
  final DealDetails data;

  const DealDetailsCard({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  _DealDetailsCardState createState() => _DealDetailsCardState();
}

class _DealDetailsCardState extends State<DealDetailsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 16.0),
          _buildGameDetails(),
        ],
      ),
    );
  }

  Widget _buildGameDetails() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: _buildGameInfo()),
        Flexible(child: _buildGameThumbnail()),
      ],
    );
  }

  Widget _buildGameInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildGameTitle(),
        _buildPrice(),
      ],
    );
  }

  Widget _buildPrice() {
    return Row(
      children: [
        Text(
          (widget.data.gameInfo.salePrice ?? Texts.current.common_no_data_separator) + "USD",
          style: AppTextStyle.italic(),
        ),
        const SizedBox(width: 8.0),
        Text(
          (widget.data.gameInfo.retailPrice ?? Texts.current.common_no_data_separator) + "USD",
          style:
              AppTextStyle.italic().copyWith(fontSize: 15, color: Colors.white70),
        ),
        const SizedBox(width: 8.0),
        Text(
          "(-${toPercentage(widget.data.gameInfo.salePrice,
              widget.data.gameInfo.retailPrice)}%)",
          style: AppTextStyle.italic().copyWith(color: Colors.green),
        ),
      ],
    );
  }

  Widget _buildGameTitle() {
    return Text(
      widget.data.gameInfo.name ?? Texts.current.common_no_data_separator,
      style: AppTextStyle.bold().copyWith(fontSize: 20),
    );
  }

  Widget _buildGameThumbnail() {
    if (widget.data.gameInfo.thumb == null) {
      return Container();
    }
    return Image.network(
      widget.data.gameInfo.thumb ?? Texts.current.common_no_data_separator,
      width: 100,
      fit: BoxFit.fitWidth,
      alignment: Alignment.topCenter,
    );
  }

  String toPercentage(String? value1, String? value2) {
    if (value1 == null || value2 == null) {
      return Texts.current.common_no_data_separator;
    }
    final percentage = (100 - ((double.parse(value1) / double.parse(value2)) * 100)).toString();
    return percentage.substring(0, percentage.indexOf('.'));
  }
}
