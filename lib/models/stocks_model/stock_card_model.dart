
class StockCardModel {
  const StockCardModel({
    required this.stockName,
    this.stockSymbol,
    this.value,
    this.stockIcon,
    this.valueChange,
    this.valueChangeIcon
});

  final String stockName;
  final String? stockSymbol;
  final int? value;
  final String? stockIcon;
  final double? valueChange;
  final String? valueChangeIcon;

}

