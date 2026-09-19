class PortfolioHoldingCardModel {
  const PortfolioHoldingCardModel({
    required this.securitySymbol,
    required this.securityName,
    required this.securityIcon,
    required this.securityPrice,
    required this.investedAmount,
    required this.totalPnL,
    required this.purchasedQuantity,
    required this.average,
  });

  final String securitySymbol;
  final String securityName;
  final String securityIcon;
  final double securityPrice;
  final double investedAmount;
  final double purchasedQuantity;
  final double totalPnL;
  final double average;


  PortfolioHoldingCardModel copyWith({
    String? securitySymbol,
    String? securityName,
    String? securityIcon,
    double? securityPrice,
    double? investedAmount,
    double? purchasedQuantity,
    double? totalPnL,
    double? average,
  }) {
    return PortfolioHoldingCardModel(
      securitySymbol: securitySymbol ?? this.securitySymbol,
      securityName: securityName ?? this.securityName,
      securityIcon: securityIcon ?? this.securityIcon,
      securityPrice: securityPrice ?? this.securityPrice,
      investedAmount: investedAmount ?? this.investedAmount,
      totalPnL: totalPnL ?? this.totalPnL,
      purchasedQuantity: purchasedQuantity ?? this.purchasedQuantity,
      average: average ?? this.average,
    );
  }
}


