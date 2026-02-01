import 'package:flutter/material.dart';
import 'package:flutteronimo/common/data_models/game_info/status/game_status.dart';

class GameStatusSelector extends StatelessWidget {
  final GameStatus current;
  final ValueChanged<GameStatus> onChanged;

  const GameStatusSelector({
    required this.current,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: GameStatus.values.map((status) {
        if (status == GameStatus.none) return const SizedBox.shrink();

        final isSelected = current == status;

        return ChoiceChip(
          label: Text(
            status.name.toUpperCase(),
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
            ),
          ),
          selected: isSelected,
          selectedColor: const Color(0xFF5CD85A),
          backgroundColor: const Color(0xFF1A1A1A),
          onSelected: (_) => onChanged(status),
        );
      }).toList(),
    );
  }
}