import "package:aprreciate/models/portfolio_holding_model/portfolio_holding_card_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class PortfolioHoldingsNotifier
    extends Notifier<List<PortfolioHoldingCardModel>> {
  @override
  List<PortfolioHoldingCardModel> build() {
    return [];
  }

  // on purchase of a new security, a holding for the same will be generated here
  void manipulateHoldings({
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

  void removeHolding({required String securitySoldSymbol}) {
    final holdingExists = state.any(
      (holding) => holding.securitySymbol == securitySoldSymbol,
    );
    if (holdingExists) {
      return print("It exists");
    }
  }



  // deduct holding amount on sell trade order -
  double deductHoldingAmount(String searchedSecuritySymbol, double sellAmount) {
    final holdingsList = state
        .where((holding) => holding.securitySymbol == searchedSecuritySymbol)
        .toList();

    if (holdingsList.isEmpty) {
      return 0.0;
    }

    final currentHoldingAmount = holdingsList[0].investedAmount;

    final updatedHoldingAmount = currentHoldingAmount - sellAmount;

    return updatedHoldingAmount;
  }



  // this will search for a specific holding and return its invested amount
  double fetchHoldingAmount(String holdingSymbol) {
    final matchingListOfItems = state
        .where((holding) => holding.securitySymbol == holdingSymbol)
        .toList();

    if (matchingListOfItems.isEmpty) {
      return 0.0;
    }
    return matchingListOfItems[0].investedAmount;
  }

  // this will search for a specific holding and return its quantity
  double fetchHoldingQuantity(String holdingSymbol) {
    final searchedHoldingList = state.where(
      (holding) => holding.securitySymbol == holdingSymbol,
    );

    if (searchedHoldingList.isEmpty) {
      return 0.0;
    }
    return searchedHoldingList.first.purchasedQuantity;
  }
}
