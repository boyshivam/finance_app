import "package:aprreciate/features/portfolio_dashboard/view_model/enums/portfolio_tabs.dart";

class PortfolioState {
  const PortfolioState({required this.selectedTab});

  final PortfolioTabsEnums selectedTab;

  PortfolioState copyWith({PortfolioTabsEnums? selectedTab}) {
    return PortfolioState(selectedTab: selectedTab ?? this.selectedTab);
  }
}
