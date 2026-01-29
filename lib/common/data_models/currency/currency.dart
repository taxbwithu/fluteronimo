enum Currency {
  usd,
  eur,
  pln,
}

extension CurrencyX on Currency {
  String get symbol {
    switch (this) {
      case Currency.usd:
        return '\$';
      case Currency.eur:
        return '€';
      case Currency.pln:
        return 'zł';
    }
  }
}