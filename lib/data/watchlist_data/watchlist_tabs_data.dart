import 'package:aprreciate/features/watchlist_dashboard/enums/watchlit_tabs_enum.dart';
import 'package:aprreciate/models/watchlist_models/watchlist_tab_model.dart';

const watchlistTabsData = [
  WatchlistTabsModel(tabName: 'US Stocks', tab: WatchlistTabsEnum.usStocks),
  WatchlistTabsModel(
    tabName: "Mutual Funds",
    tab: WatchlistTabsEnum.mutualFunds,
  ),
];
