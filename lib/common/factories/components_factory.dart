import 'package:flutter/material.dart';
import 'package:flutteronimo/gen/assets.gen.dart';

class ComponentsFactory {
  static const _navBarIconWidth = 24.0;
  static const _navBarIconHeight = 24.0;

  static Widget createNavBarDrawerButton() {
    return Assets.images.menuIcon.image(
      height: _navBarIconHeight,
      width: _navBarIconWidth,
      color: Colors.white,
    );
  }

  static Widget createBackArrowButton() {
    return Assets.images.backArrow.image(
      height: _navBarIconHeight,
      width: _navBarIconWidth,
      color: Colors.white,
    );
  }
}
