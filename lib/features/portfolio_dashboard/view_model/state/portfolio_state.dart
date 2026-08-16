import "package:aprreciate/features/portfolio_dashboard/view_model/enums/net_change_frequency_tabs.dart";
import "package:aprreciate/features/portfolio_dashboard/view_model/enums/portfolio_tabs.dart";

class PortfolioState {
  const PortfolioState({
    required this.selectedProductTab,
    required this.selectedNetChangeFrequencyTab,
    required this.investedAmount,
    required this.currentAmount,
    required this.totalPnLChange,
    required this.totalPnLPercentageChange,
    required this.dailyPnLChange,
    required this.dailyPnLPercentageChange,
  });

  final PortfolioTabsEnums selectedProductTab;
  final NetChangeFrequencyTabs selectedNetChangeFrequencyTab;
  final double investedAmount;
  final double currentAmount;
  final double totalPnLChange;
  final double totalPnLPercentageChange;
  final double dailyPnLChange;
  final double dailyPnLPercentageChange;

  PortfolioState copyWith({
    PortfolioTabsEnums? selectedProductTab,
    NetChangeFrequencyTabs? selectedNetChangeFrequencyTab,
    double? investedAmount,
    double? currentAmount,
    double? totalPnLChange,
    double? totalPnLPercentageChange,
    double? dailyPnLChange,
    double? dailyPnLPercentageChange,
  }) {
    return PortfolioState(
      selectedProductTab: selectedProductTab ?? this.selectedProductTab,
      selectedNetChangeFrequencyTab:
          selectedNetChangeFrequencyTab ?? this.selectedNetChangeFrequencyTab,
      investedAmount: investedAmount ?? this.investedAmount,
      currentAmount: currentAmount ?? this.currentAmount,
      totalPnLChange: totalPnLChange ?? this.currentAmount,
      totalPnLPercentageChange:
          totalPnLPercentageChange ?? this.totalPnLPercentageChange,
      dailyPnLChange: dailyPnLChange ?? this.dailyPnLChange,
      dailyPnLPercentageChange:
          dailyPnLPercentageChange ?? this.dailyPnLPercentageChange,
    );
  }
}
