import "package:aprreciate/features/watchlist_dashboard/view_model/states/all_watchlists_state.dart";
import "package:aprreciate/models/stocks_model/stock_card_model.dart";
import "package:aprreciate/models/watchlist_models/watchlist_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class AllWatchListsNotifier extends Notifier<AllWatchlistsState> {
  @override
  AllWatchlistsState build() {
    return AllWatchlistsState(allWatchlistsList: []);
  }

  // add new watchlist
  void addWatchlist(IndividualWatchlistModel watchlist) {
    state = state.copyWith(
      allWatchlistsList: [...state.allWatchlistsList, watchlist],
    );
  }


  // add or remove securities from a watchlist
  void manipulateWatchlistSecurities({
    required String? watchlistId,
    required StockCardModel security,
  }) {
    state = state.copyWith(
      allWatchlistsList: state.allWatchlistsList.map((watchlist) {
        if (watchlist.watchlistId != watchlistId) {
          return watchlist;
        }

        final securityExists = watchlist.securities.any(
          (e) => e.stockSymbol == security.stockSymbol,
        );

        if (securityExists) {
          return watchlist.copyWith(
            securities: watchlist.securities
                .where((e) => e.stockSymbol != security.stockSymbol)
                .toList(),
          );
        }

        return watchlist.copyWith(
          securities: [...watchlist.securities, security],
        );
      }).toList(),
    );
  }


  // check if a particular security exists in multiple watchlists
  bool isSecurityInAnyWatchlist(String securitySymbol) {
    return state.allWatchlistsList.any(
      (watchlist) => watchlist.securities.any(
        (security) => security.stockSymbol == securitySymbol,
      ),
    );
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
