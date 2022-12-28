import 'package:flutter/cupertino.dart';
import 'package:flutteronimo/gen/colors.gen.dart';

class AppDecorator {
  static BoxDecoration drawBackgroundGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
          colors: [ColorName.primaryDark, ColorName.safeAreaDark],
          begin: const FractionalOffset(1.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp),
    );
  }
}
