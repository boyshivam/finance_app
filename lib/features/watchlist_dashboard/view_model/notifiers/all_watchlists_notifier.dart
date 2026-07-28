import "package:aprreciate/features/watchlist_dashboard/view_model/states/all_watchlists_state.dart";
import "package:aprreciate/models/watchlist_models/watchlist_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class AllWatchListsNotifier extends Notifier<AllWatchlistsState> {
  @override
  AllWatchlistsState build() {
    return AllWatchlistsState(
      selectedWatchlistName: "",
      selectedWatchlistId: "",
      allWatchlistsList: [],
    );
  }

  // add new watchlist
  void addWatchlist(IndividualWatchlistModel watchlist) {
    state = state.copyWith(
      allWatchlistsList: [...state.allWatchlistsList, watchlist],
    );
  }

  // add stock to watchlist
  void addSecurityToDescendantWatchlist({
    required String? watchlistId,
    required security,
  }) {
    state = state.copyWith(
      allWatchlistsList: state.allWatchlistsList.map((watchlist) {
        if (watchlist.watchlistId == watchlistId) {
          return watchlist.copyWith(
            securities: [...watchlist.securities, security],
          );
        }
        return watchlist;
      }).toList(),
    );
  }


  // add stock to elected watchlist
  void addStockToSelectedWatchlist(){

  }

  // selected watchlist
  void selectedWatchlist({
    required String watchlistId,
    required String watchlistName,
  }) {
    state = state.copyWith(
      selectedWatchlistId: watchlistId,
      selectedWatchlistName: watchlistName,
    );
  }
}
