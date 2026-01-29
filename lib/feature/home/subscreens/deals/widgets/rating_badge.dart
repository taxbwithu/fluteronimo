import 'package:flutter/material.dart';
import 'package:flutteronimo/common/theme/app_text_style.dart';

class RatingBadge extends StatelessWidget {
  final String rating;

  const RatingBadge({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8,
      left: 8,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(210),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.star,
              size: 14,
              color: Colors.white,
            ),
            const SizedBox(width: 4),
            Text(
              rating,
              style: AppTextStyle.caption2Bold(),
            ),
          ],
        ),
      ),
    );
  }
}
