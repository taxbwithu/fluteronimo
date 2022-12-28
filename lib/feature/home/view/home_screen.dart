import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.redAccent,
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                FirebaseCrashlytics.instance.crash();
              },
              child: Text("Crash the app!"),
            ),
          ),
        ),
      ),
    );
  }
}
