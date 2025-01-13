abstract class CurrencyEvent {}

class ConvertCurrencyEvent extends CurrencyEvent {
  final double amount;
  final String fromCurrency;
  final String toCurrency;

  ConvertCurrencyEvent(this.amount, this.fromCurrency, this.toCurrency);
}