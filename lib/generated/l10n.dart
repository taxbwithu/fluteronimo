// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Texts {
  Texts();

  static Texts? _current;

  static Texts get current {
    assert(_current != null,
        'No instance of Texts was loaded. Try to initialize the Texts delegate before accessing Texts.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Texts> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Texts();
      Texts._current = instance;

      return instance;
    });
  }

  static Texts of(BuildContext context) {
    final instance = Texts.maybeOf(context);
    assert(instance != null,
        'No instance of Texts present in the widget tree. Did you add Texts.delegate in localizationsDelegates?');
    return instance!;
  }

  static Texts? maybeOf(BuildContext context) {
    return Localizations.of<Texts>(context, Texts);
  }

  /// `Something went wrong, please try again.`
  String get error_view_default_message {
    return Intl.message(
      'Something went wrong, please try again.',
      name: 'error_view_default_message',
      desc: '',
      args: [],
    );
  }

  /// `Test`
  String get test_screen_message {
    return Intl.message(
      'Test',
      name: 'test_screen_message',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Texts> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'GB'),
      Locale.fromSubtags(languageCode: 'pl', countryCode: 'PL'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Texts> load(Locale locale) => Texts.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
