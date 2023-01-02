import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../storage_and_settings/data_model/shared_preference_key.dart';
import '../storage_and_settings/shared_preferences_storage.dart';

class MultiLocaleRepository {
  final SharedPreferencesStorage sharedPrefs;

  static const Locale defaultLocale =
      Locale.fromSubtags(languageCode: 'en', countryCode: 'GB');

  final BehaviorSubject<Locale> _selectedLocale = BehaviorSubject();
  ValueStream<Locale> get selectedLocale => _selectedLocale;

  MultiLocaleRepository({
    required this.sharedPrefs,
  });

  Future loadLocale() async {
    final currentLocale = await _loadLocale();

    if (_needUpdate(currentLocale)) {
      _selectedLocale.add(currentLocale);
    }
  }

  bool _needUpdate(Locale newLocale) =>
      !_selectedLocale.hasValue || _selectedLocale.value != newLocale;

  Future<Locale> _loadLocale() async {
    final savedLocale = await sharedPrefs.getValueFor(
        key: SharedPreferenceKey.preferredLanguage);

    if (savedLocale != null) {
      final languageComponents = (savedLocale as String)
          .split("_");
      final language = languageComponents[0];
      final country =
          languageComponents.length > 1 ? languageComponents[1] : null;
      return Locale.fromSubtags(languageCode: language, countryCode: country);
    }
    return defaultLocale;
  }

  Future saveLocale(Locale newLocale) async {
    if (_needUpdate(newLocale)) {
      _selectedLocale.add(newLocale);
      await _saveLocaleName(localName: newLocale.toString());
    }
  }

  Future _saveLocaleName({
    required String localName,
  }) async {
    return await sharedPrefs.saveString(
      value: localName,
      forKey: SharedPreferenceKey.preferredLanguage,
    );
  }
}
