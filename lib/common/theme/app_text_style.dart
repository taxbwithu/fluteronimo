import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle title() {
    return const TextStyle(
      fontSize: 24.0,
      fontFamily: "Roboto",
      fontWeight: FontWeight.w500,
      color: Colors.white,
    );
  }

  static TextStyle body() {
    return const TextStyle(
      fontSize: 17.0,
      fontFamily: "Roboto",
      fontWeight: FontWeight.normal,
      color: Colors.white,
    );
  }

  static TextStyle bold() {
    return const TextStyle(
      fontSize: 17.0,
      fontFamily: "Roboto",
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }
}
