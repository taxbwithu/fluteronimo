import 'package:flutter/material.dart';
import 'package:flutteronimo/common/theme/app_text_style.dart';

class DiscountBadge extends StatelessWidget {
  final int discount;

  const DiscountBadge({required this.discount});

  @override
  Widget build(BuildContext context) {
    if (discount <= 0) return const SizedBox.shrink();

    return Positioned(
      top: 8,
      right: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(210),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          '-$discount%',
          style: AppTextStyle.caption2Bold(),
        ),
      ),
    );
  }
}