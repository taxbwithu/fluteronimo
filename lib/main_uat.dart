import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutteronimo/app/app.dart';
import 'package:flutteronimo/app/environment.dart';

void main() {
  final app = MyApp(
    environment: Environment.uat
  );

  runZonedGuarded(() async {
    runApp(app);
  }, (error,stack) {print(error);});
}