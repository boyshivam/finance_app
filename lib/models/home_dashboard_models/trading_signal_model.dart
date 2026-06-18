

class TradingSignalModel {
  const TradingSignalModel({
    required this.stockIcon,
    required this.stockSymbol,
    required this.currentPrice,
    required this.entryPrice,
    required this.exitPrice,
    required this.gain,
    required this.verdict
});

  final String stockIcon;
  final String stockSymbol;
  final String  currentPrice;
  final String entryPrice;
  final String exitPrice;
  final String gain;
  final String verdict;

}