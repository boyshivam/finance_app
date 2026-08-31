import "package:aprreciate/features/portfolio_dashboard/view_model/enums/net_change_frequency_tabs.dart";
import "package:aprreciate/features/portfolio_dashboard/view_model/enums/portfolio_tabs.dart";
import "package:aprreciate/features/portfolio_dashboard/view_model/provider/portfolio_holdings_provider.dart";
import "package:aprreciate/features/portfolio_dashboard/view_model/state/portfolio_state.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class PortfolioNotifier extends Notifier<PortfolioState> {
  @override
  PortfolioState build() {
    final portfolioHoldings = ref.watch(portfolioHoldingsProvider);

    // calculating the invested amount for total P&L
    final sumOfInvestedAmountOfPortfolio = portfolioHoldings.fold(
      0.0,
      (sum, holding) => sum + holding.investedAmount,
    );

    // calculate the current amount
    final totalPnLChangeOfPortfolio = portfolioHoldings.fold(
      0.0,
      (sum, holding) => sum + holding.totalPnL,
    );

    // fi

    return PortfolioState(
      selectedProductTab: PortfolioTabsEnums.usStocks,
      selectedNetChangeFrequencyTab: NetChangeFrequencyTabs.totalPnL,
      investedAmount: sumOfInvestedAmountOfPortfolio,
      currentAmount: 0,
      totalPnLChange: totalPnLChangeOfPortfolio,
      totalPnLPercentageChange: 0,
      dailyPnLChange: 0,
      dailyPnLPercentageChange: 0,
    );
  }

  // change the selected tab
  void selectPortfolioTab(PortfolioTabsEnums newSelectedTab) {
    state = state.copyWith(selectedProductTab: newSelectedTab);
  }

  // change the selected frequency tab
  void selectChangeFrequencyTab(NetChangeFrequencyTabs selectedTab) {
    state = state.copyWith(selectedNetChangeFrequencyTab: selectedTab);
  }
}
