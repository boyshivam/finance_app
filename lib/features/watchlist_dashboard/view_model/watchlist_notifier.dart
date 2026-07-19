import 'package:aprreciate/data/common_data/common_securities_data.dart';
import 'package:aprreciate/data/watchlist_data/watchlist_items_data.dart';
import 'package:aprreciate/features/watchlist_dashboard/enums/watchlist_createfield_enum.dart';
import 'package:aprreciate/features/watchlist_dashboard/enums/watchlit_tabs_enum.dart';
import 'package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_dashboard_widgets/create_watchlist_bottomsheet.dart';
import 'package:aprreciate/features/watchlist_dashboard/view_model/watchlist_state.dart';
import 'package:aprreciate/models/stocks_model/stock_card_model.dart';
import 'package:aprreciate/models/watchlist_models/individual_watchlist_card_model.dart';
import 'package:aprreciate/models/watchlist_models/watchlist_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WatchlistNotifier extends Notifier<WatchlistState> {
  @override
  WatchlistState build() {
    return WatchlistState(
        selectedTab: WatchlistTabsEnum.usStocks,
        watchlistName: "",
        watchlistCreateField: WatchlistCreateFieldEnum.neutral,
        searchedSecurity: "",
        searchResults: []
    );
  }

  // derive the watchlist name from the text field
  void deriveWatchlistName(String name) {
    state = state.copyWith(watchlistName: name);
  }

  // derive searched security
  void deriveSearchedSecurity(String security) {
    state = state.copyWith(searchedSecurity: security);
  }

  // change the watchlist tab
  void changeTab(WatchlistTabsEnum selectedTab) {
    state = state.copyWith(selectedTab: selectedTab);
  }

  // open create watchlist bottom sheet on clicking on create
  void createWatchlistBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CreateWatchlistBottomSheet();
      },
    );
  }

  // save a watchlist
  void saveNewWatchList() {
    final name = state.watchlistName;

    if (name
        .trim()
        .isEmpty) {
      state = state.copyWith(
        watchlistCreateField: WatchlistCreateFieldEnum.empty,
      );
    } else {
      final newWatchlist = WatchlistModel(watchlistName: state.watchlistName);
      ref.read(watchListItemsDataProvider.notifier).addWatchlist(newWatchlist);
    }
  }

  // search for security in db
  void searchSecurity(String security) {
    final query = security.toLowerCase();

    final allSecurities = ref.read(commonSecuritiesProvider);

    state.searchResults = allSecurities.where((stock) =>
        stock.stockName.toLowerCase().contains(query)).toList();

  }
}
