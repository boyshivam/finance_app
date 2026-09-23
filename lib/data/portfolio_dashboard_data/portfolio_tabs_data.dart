import 'package:aprreciate/features/portfolio_dashboard/models/portfolio_tab_model.dart';
import 'package:aprreciate/features/portfolio_dashboard/view_model/enums/portfolio_tabs.dart';

const List<PortfolioTabModel> portfolioTabs = [
  PortfolioTabModel(name: "US Stocks", product: PortfolioTabsEnums.usStocks),
  PortfolioTabModel(name: "All", product: PortfolioTabsEnums.all),
  PortfolioTabModel(
    name: "Mutual Funds",
    product: PortfolioTabsEnums.mutualFunds,
  ),
];
