import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutteronimo/app/app.dart';
import 'package:flutteronimo/app/environment.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final app = MyApp(
    environment: Environment.uat
  );

  runZonedGuarded(() async {
    runApp(app);
  }, (error,stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
  });
}