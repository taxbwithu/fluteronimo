import 'package:flutter/material.dart';
import 'package:flutteronimo/common/repositories/multilocale/multilocale_repository.dart';
import 'package:rxdart/rxdart.dart';

class MultiLocaleControllerVm {
  final MultiLocaleRepository repository;

  MultiLocaleControllerVm({
    required this.repository,
  });

  ValueStream<Locale> get selectedLocale => repository.selectedLocale;

  void loadLocale() async {
    repository.loadLocale();
  }

  Future saveLocale(Locale newLocale) async {
    await repository.saveLocale(newLocale);
  }
}
