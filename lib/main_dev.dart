import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutteronimo/app/app.dart';
import 'package:flutteronimo/app/environment.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  final app = MyApp(
    environment: Environment.dev
  );

  runZonedGuarded(() async {
    runApp(app);
  }, (error,stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
  });
}