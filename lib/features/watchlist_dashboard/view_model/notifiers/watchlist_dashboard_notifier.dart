import 'package:aprreciate/data/common_data/common_securities_data.dart';
import 'package:aprreciate/features/watchlist_dashboard/enums/is_security_favourite_enum.dart';
import 'package:aprreciate/features/watchlist_dashboard/enums/search_result_status_enum.dart';
import 'package:aprreciate/features/watchlist_dashboard/enums/watchlist_createfield_enum.dart';
import 'package:aprreciate/features/watchlist_dashboard/enums/watchlit_tabs_enum.dart';
import 'package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_dashboard_widgets/create_watchlist_bottomsheet.dart';
import 'package:aprreciate/features/watchlist_dashboard/view_model/providers/all_watchlists_provider.dart';
import 'package:aprreciate/features/watchlist_dashboard/view_model/states/watchlist_dashboard_state.dart';
import 'package:aprreciate/models/watchlist_models/watchlist_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class WatchlistDashboardNotifier extends Notifier<WatchlistState> {
  @override
  WatchlistState build() {
    return WatchlistState(
      selectedTab: WatchlistTabsEnum.usStocks,
      watchlistName: "",
      watchlistCreateField: WatchlistCreateFieldEnum.neutral,
      searchedSecurity: "",
      searchResults: [],
      searchResultsStatus: SearchResultStatusEnum.empty,
      isSecurityFavourite: IsSecurityFavouriteEnum.notFav,
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

    if (name.trim().isEmpty) {
      state = state.copyWith(
        watchlistCreateField: WatchlistCreateFieldEnum.empty,
      );
    } else {
      final newWatchlist = IndividualWatchlistModel(
        watchlistName: state.watchlistName,
      );
      ref.read(allWatchListsProvider.notifier).addWatchlist(newWatchlist);
    }
  }

  // search for security in db
  void searchSecurity(String security) {
    final query = security.toLowerCase();

    final allSecurities = ref.read(commonSecuritiesProvider);

    final matchedResults = allSecurities
        .where((stock) => stock.stockName.toLowerCase().contains(query))
        .toList();

    if (query.trim().isEmpty) {
      state = state.copyWith(
        searchResultsStatus: SearchResultStatusEnum.empty,
        searchResults: [],
      );
    } else if (matchedResults.isEmpty) {
      state = state.copyWith(
        searchResultsStatus: SearchResultStatusEnum.noResults,
        searchResults: [],
      );
    } else if (matchedResults.isNotEmpty) {
      state = state.copyWith(
        searchResultsStatus: SearchResultStatusEnum.resultsFound,
        searchResults: matchedResults,
      );
    }
  }

  // add a stock to watchlist
  void toggleSecurityAsFavourite() {
    if (state.isSecurityFavourite == IsSecurityFavouriteEnum.notFav) {
      state = state.copyWith(isSecurityFavourite: IsSecurityFavouriteEnum.fav);
    } else if (state.isSecurityFavourite == IsSecurityFavouriteEnum.fav) {
      state = state.copyWith(
        isSecurityFavourite: IsSecurityFavouriteEnum.notFav,
      );
    }
  }
}
