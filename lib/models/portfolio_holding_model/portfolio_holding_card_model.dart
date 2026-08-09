class PortfolioHoldingCardModel {
  const PortfolioHoldingCardModel({
    required this.securitySymbol,
    required this.securityName,
    required this.securityIcon,
    required this.securityPrice,
    required this.investedAmount,
    required this.purchasedQuantity,
    required this.average,
  });

  final String securitySymbol;
  final String securityName;
  final String securityIcon;
  final double securityPrice;
  final double investedAmount;
  final double purchasedQuantity;
  final double average;
}
