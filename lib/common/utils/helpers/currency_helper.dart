import 'package:flutteronimo/common/data_models/currency/currency.dart';

class CurrencyHelper {
  static String formatPrice(String rawPrice, Currency currency) {
    final value = double.tryParse(
      rawPrice.replaceAll(RegExp(r'[^\d.]'), ''),
    );

    if (value == null) return rawPrice;

    return '${currency.symbol}${value.toStringAsFixed(2)}';
  }
}