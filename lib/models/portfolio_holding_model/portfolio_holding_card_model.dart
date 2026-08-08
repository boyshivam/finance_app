

class PortfolioHoldingCardModel {
  const PortfolioHoldingCardModel({
    required this.securityName,
    required this.securityPrice,
    required this.investedAmount,
    required this.purchasedQuantity
});

  final String securityName;
  final double securityPrice;
  final double investedAmount;
  final double purchasedQuantity;

}