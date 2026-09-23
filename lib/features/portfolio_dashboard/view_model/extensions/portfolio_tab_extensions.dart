import 'package:aprreciate/features/portfolio_dashboard/view_model/enums/portfolio_tabs.dart';

extension PortfolioTabExtensions on PortfolioTabsEnums {
  String get tabName {
    switch (this) {
      case PortfolioTabsEnums.usStocks:
        return "US Stocks";

      case PortfolioTabsEnums.all:
        return "All";

      case PortfolioTabsEnums.mutualFunds:
        return "Mutual Funds";
    }
  }
}
