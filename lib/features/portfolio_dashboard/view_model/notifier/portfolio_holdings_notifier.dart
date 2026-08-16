import "package:aprreciate/models/portfolio_holding_model/portfolio_holding_card_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class PortfolioHoldingsNotifier
    extends Notifier<List<PortfolioHoldingCardModel>> {
  @override
  List<PortfolioHoldingCardModel> build() {
    return [];
  }

  // on purchase of a new security, a holding for the same will be generated here
  void addHolding({
    required String securitySymbol,
    required PortfolioHoldingCardModel newHolding,
  }) {
    final holdingExists = state.any(
      (holding) => holding.securitySymbol == securitySymbol,
    );

    if (!holdingExists) {
      state = [...state, newHolding];
      return;
    }

    state = state.map((holding) {
      if (holding.securitySymbol != securitySymbol) {
        return holding;
      }

      final totalQuantity =
          holding.purchasedQuantity + newHolding.purchasedQuantity;

      final totalInvestedAmount =
          holding.investedAmount + newHolding.investedAmount;

      final newAverage = totalInvestedAmount / totalQuantity;

      final totalPnL = (holding.securityPrice - newAverage) * totalQuantity;

      return PortfolioHoldingCardModel(
        securityIcon: newHolding.securityIcon,
        securityName: newHolding.securityName,
        securitySymbol: newHolding.securitySymbol,
        securityPrice: newHolding.securityPrice,
        investedAmount: totalInvestedAmount,
        totalPnL: totalPnL,
        purchasedQuantity: totalQuantity,
        average: newAverage,
      );
    }).toList();
  }
}
