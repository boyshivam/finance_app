
class StockCardModel {
  const StockCardModel({
    required this.stockName,
    required this.stockSymbol,
    required this.value,
    required this.stockIcon,
    required this.valueChangePerc,
    required this.valueChange,
    required this.valueChangeIcon,
    required this.isFavourite,

  });

  final String stockName;
  final String stockSymbol;
  final double value;
  final String stockIcon;
  final double valueChangePerc;
  final double valueChange;
  final bool valueChangeIcon;
  final bool isFavourite;

}
