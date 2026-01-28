import 'package:flutter/material.dart';
import 'package:flutteronimo/gen/assets.gen.dart';
import 'package:flutteronimo/gen/colors.gen.dart';

class CustomLoadingOverlay extends StatelessWidget {
  const CustomLoadingOverlay();

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: ColoredBox(
        color: ColorName.white.withAlpha(10),
        child: Center(
          child: _buildAnimation(),
        ),
      ),
    );
  }

  Widget _buildAnimation() {
    return Image.asset(
      Assets.animations.loading.path,
      height: 100.0,
      width: 100.0,
    );
  }
}