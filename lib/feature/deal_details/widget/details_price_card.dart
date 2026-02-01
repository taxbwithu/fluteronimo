import 'package:flutter/material.dart';

class DetailsPriceCard extends StatelessWidget {
  final String salePrice;
  final String retailPrice;
  final String cheapestEver;
  final String cheapestDate;

  const DetailsPriceCard({
    required this.salePrice,
    required this.retailPrice,
    required this.cheapestEver,
    required this.cheapestDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Current price',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                '\$$salePrice',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '\$$retailPrice',
                style: const TextStyle(
                  color: Colors.white38,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Cheapest ever: \$$cheapestEver • $cheapestDate',
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}