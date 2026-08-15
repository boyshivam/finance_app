import "package:aprreciate/features/portfolio_dashboard/view_model/enums/portfolio_tabs.dart";
import "package:aprreciate/features/portfolio_dashboard/view_model/state/portfolio_state.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class PortfolioNotifier extends Notifier<PortfolioState> {
  @override
  PortfolioState build() {
    return PortfolioState(selectedTab: PortfolioTabsEnums.usStocks);
  }

  // change the selected tab
  void selectPortfolioTab(PortfolioTabsEnums newSelectedTab) {
    state = state.copyWith(
      selectedTab: newSelectedTab
    );
  }
}
