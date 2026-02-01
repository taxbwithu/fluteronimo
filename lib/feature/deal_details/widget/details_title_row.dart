import 'package:flutter/material.dart';

class DetailsTitleRow extends StatelessWidget {
  final String title;
  final bool isWishlisted;
  final VoidCallback onWishlistTap;

  const DetailsTitleRow({
    required this.title,
    required this.isWishlisted,
    required this.onWishlistTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            isWishlisted ? Icons.favorite : Icons.favorite_border,
            color: isWishlisted ? Colors.redAccent : Colors.white,
          ),
          onPressed: onWishlistTap,
        ),
      ],
    );
  }
}