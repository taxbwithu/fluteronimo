import 'package:flutter/material.dart';
import 'package:flutteronimo/common/data_models/game_info/game_info.dart';
import 'package:flutteronimo/common/data_models/game_info/ws/game_info_ws.dart';
import 'package:flutteronimo/generated/l10n.dart';

class DetailsHeaderImage extends StatelessWidget {
  final GameInfo game;

  const DetailsHeaderImage({required this.game,});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      pinned: true,
      backgroundColor: Colors.black,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              game.thumbnailFull ?? Texts.current.common_no_data_separator,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}