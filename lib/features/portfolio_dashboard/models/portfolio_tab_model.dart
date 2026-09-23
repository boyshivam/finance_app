


import 'package:aprreciate/features/portfolio_dashboard/view_model/enums/portfolio_tabs.dart';

class PortfolioTabModel {
  const PortfolioTabModel ({
    required this.name,
    required this.product
});

  final String name;
  final PortfolioTabsEnums product;

}