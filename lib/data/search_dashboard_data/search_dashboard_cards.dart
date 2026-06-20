import 'package:aprreciate/core/constants/app_assets/app_assets.dart';
import 'package:aprreciate/models/search_dashboard_models/search_dashboard_card_model.dart';

const List<SearchDashboardCardModel> searchDashboardCards = [
  SearchDashboardCardModel(
    icon: AppAssets.apple_icon,
    itemSymbol: "AAPL",
    itemName: "Apple",
    itemType: "Stock",
  ),
  SearchDashboardCardModel(
    icon: AppAssets.amazon_icon,
    itemSymbol: "AMZN",
    itemName: "Amazon",
    itemType: "Stock",
  ),
  SearchDashboardCardModel(
    icon: AppAssets.microsoft_icon,
    itemSymbol: "MSFT",
    itemName: "Microsoft",
    itemType: "Stock",
  ),
  SearchDashboardCardModel(
    icon: AppAssets.tesla_icon,
    itemSymbol: "TSLA",
    itemName: "Tesla",
    itemType: "Stock",
  ),
];
