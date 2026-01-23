import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle title() {
    return const TextStyle(
      fontSize: 24.0,
      fontFamily: "Inter",
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
  }

  static TextStyle body() {
    return const TextStyle(
      fontSize: 17.0,
      fontFamily: "Inter",
      fontWeight: FontWeight.normal,
      color: Colors.white,
    );
  }

  static TextStyle bold() {
    return const TextStyle(
      fontSize: 17.0,
      fontFamily: "Inter",
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  static TextStyle italic() {
    return const TextStyle(
      fontSize: 17.0,
      fontFamily: "Inter",
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.normal,
      color: Colors.white,
      height: 1.2,
    );
  }
}
