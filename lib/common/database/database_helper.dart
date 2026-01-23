import 'dart:io';

import 'package:flutteronimo/hive_registrar.g.dart';
import 'package:hive_ce/hive.dart';
import 'package:flutteronimo/common/data_models/user/db/user_db.dart';

class DatabaseHelper {
  static const String _usersBoxName = 'users';

  static Future<void> init() async {
    final path = Directory.current.path;
    Hive
      ..init(path)
      ..registerAdapters();
    
    // Register Adapters
    if (!Hive.isAdapterRegistered(UserDbAdapter().typeId)) {
      Hive.registerAdapter(UserDbAdapter());
    }

    // Open boxes
    await Hive.openBox<UserDb>(_usersBoxName);
  }

  static Box<UserDb> getUsersBox() {
    return Hive.box<UserDb>(_usersBoxName);
  }
}
