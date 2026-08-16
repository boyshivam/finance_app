import "package:aprreciate/features/portfolio_dashboard/view_model/enums/net_change_frequency_tabs.dart";
import "package:aprreciate/features/portfolio_dashboard/view_model/enums/portfolio_tabs.dart";
import "package:aprreciate/features/portfolio_dashboard/view_model/state/portfolio_state.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class PortfolioNotifier extends Notifier<PortfolioState> {
  @override
  PortfolioState build() {
    return PortfolioState(
      selectedProductTab: PortfolioTabsEnums.usStocks,
      selectedNetChangeFrequencyTab: NetChangeFrequencyTabs.totalPnL,
      investedAmount: 0,
      currentAmount: 0,
      totalPnLChange: 0,
      totalPnLPercentageChange: 0,
      dailyPnLChange: 0,
      dailyPnLPercentageChange: 0,
    );
  }


  // change the selected tab
  void selectPortfolioTab(PortfolioTabsEnums newSelectedTab) {
    state = state.copyWith(selectedProductTab: PortfolioTabsEnums.usStocks);
  }


  // change the selected frequency tab
  void selectChangeFrequencyTab(NetChangeFrequencyTabs selectedTab) {
    state = state.copyWith(selectedNetChangeFrequencyTab: selectedTab);
  }


}
