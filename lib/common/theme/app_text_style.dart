import 'package:flutter/material.dart';
import 'package:flutteronimo/gen/colors.gen.dart';

class AppTextStyle {
  static TextStyle title() {
    return const TextStyle(
      fontSize: 24.0,
      fontFamily: "Inter",
      fontWeight: FontWeight.w600,
      color: ColorName.white,
    );
  }

  static TextStyle body() {
    return const TextStyle(
      fontSize: 17.0,
      fontFamily: "Inter",
      fontWeight: FontWeight.normal,
      color: ColorName.white,
    );
  }

  static TextStyle body2Bold() {
    return const TextStyle(
      fontSize: 15.0,
      fontFamily: "Inter",
      fontWeight: FontWeight.w600,
      color: ColorName.white,
    );
  }

  static TextStyle bold({
    Color? color,
  }) {
    return TextStyle(
      fontSize: 17.0,
      fontFamily: "Inter",
      fontWeight: FontWeight.bold,
      color: color ?? ColorName.white,
    );
  }

  static TextStyle italic() {
    return const TextStyle(
      fontSize: 17.0,
      fontFamily: "Inter",
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.normal,
      color: ColorName.white,
      height: 1.2,
    );
  }

  static TextStyle caption1crossed({
    Color? color,
  }) {
    return TextStyle(
      fontSize: 13,
      decoration: TextDecoration.lineThrough,
      decorationColor: ColorName.white.withAlpha(40),
      fontFamily: "Inter",
      decorationThickness: 2,
      color: color ?? ColorName.white,
    );
  }

  static TextStyle caption2({
    Color? color,
  }) {
    return TextStyle(
      fontSize: 12.0,
      fontFamily: "Inter",
      color: color ?? Colors.white,
    );
  }

  static TextStyle caption2Bold() {
    return const TextStyle(
      fontSize: 12.0,
      fontFamily: "Inter",
      fontWeight: FontWeight.w600,
      color: ColorName.white,
      letterSpacing: 0.2,
    );
  }

  static TextStyle caption3() {
    return const TextStyle(
      fontSize: 11.0,
      fontFamily: "Inter",
      fontWeight: FontWeight.w500,
      color: ColorName.white,
      letterSpacing: 0.2,
    );
  }

  static TextStyle caption3Bold({
    Color? color,
  }) {
    return TextStyle(
      fontSize: 11.0,
      fontFamily: "Inter",
      fontWeight: FontWeight.w700,
      color: color ?? ColorName.white,
      letterSpacing: 0.2,
    );
  }
}
