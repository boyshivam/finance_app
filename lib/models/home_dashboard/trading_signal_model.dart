

class TradingSignalModel {
  const TradingSignalModel({
    required this.stockIcon,
    required this.stockSymbol,
    required this.currentPrice,
    required this.entryPrice,
    required this.exitPrice,
    required this.gain
});

  final String stockIcon;
  final String stockSymbol;
  final double currentPrice;
  final double entryPrice;
  final double exitPrice;
  final double gain;

}