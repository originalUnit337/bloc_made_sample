abstract class CurrencyState {}

class CurrencyInitial extends CurrencyState {}

class CurrencyLoading extends CurrencyState {}

class CurrencyConverted extends CurrencyState {
  final double convertedAmount;

  CurrencyConverted(this.convertedAmount);
}

class CurrencyError extends CurrencyState {
  final String message;

  CurrencyError(this.message);
}