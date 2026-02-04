import 'package:flutter/material.dart';
import 'package:flutteronimo/common/data_models/game_info/game_info.dart';
import 'package:flutteronimo/common/data_models/game_info/ws/game_info_ws.dart';

class DetailsRatingsRow extends StatelessWidget {
  final GameInfo game;

  const DetailsRatingsRow({
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, size: 16, color: Colors.white),
        const SizedBox(width: 4),
        Text(
          "10", // TODO placeholder text,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(width: 16),
        const Icon(Icons.star_border, size: 16, color: Colors.white),
        const SizedBox(width: 4),
        Text(
          "98", // TODO placeholder text
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
