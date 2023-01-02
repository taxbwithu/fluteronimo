import 'package:flutteronimo/common/repositories/storage_and_settings/data_model/shared_preference_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesStorage {
  Future saveString({
    required String value,
    required SharedPreferenceKey forKey,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = forKey.rawValue;
    prefs.setString(key, value);
  }

  Future saveBool({
    required bool value,
    required SharedPreferenceKey forKey,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final key = forKey.rawValue;
    prefs.setBool(key, value);
  }

  Future<Object?> getValueFor({
    required SharedPreferenceKey key,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key.rawValue);
  }

  Future deleteValueFor({
    required SharedPreferenceKey key,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key.rawValue);
  }

  Future deleteAllValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();
    for (String key in keys) {
      prefs.remove(key);
    }
  }
}
