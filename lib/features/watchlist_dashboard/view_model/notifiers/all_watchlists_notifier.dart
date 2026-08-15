import "package:aprreciate/features/watchlist_dashboard/enums/watchlist_snackbar_text_enum.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/states/all_watchlists_state.dart";
import "package:aprreciate/models/stocks_model/stock_card_model.dart";
import "package:aprreciate/models/watchlist_models/watchlist_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class AllWatchListsNotifier extends Notifier<AllWatchlistsState> {

  bool isAdded = false;

  @override
  AllWatchlistsState build() {
    return AllWatchlistsState(
        watchlistMessage: WatchlistSnackbarTextEnum.neutral ,
        allWatchlistsList: []);
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

    WatchlistSnackbarTextEnum? message;

    state = state.copyWith(
      allWatchlistsList: state.allWatchlistsList.map((watchlist) {
        if (watchlist.watchlistId != watchlistId) {
          return watchlist;
        }

        final securityExists = watchlist.securities.any(
          (e) => e.stockSymbol == security.stockSymbol,
        );

        if (securityExists) {

          message = WatchlistSnackbarTextEnum.removed;

          return watchlist.copyWith(
            securities: watchlist.securities
                .where((e) => e.stockSymbol != security.stockSymbol)
                .toList(),
          );
        }

        message = WatchlistSnackbarTextEnum.added;

        return watchlist.copyWith(
          securities: [...watchlist.securities, security],
        );
      }).toList(),
      watchlistMessage: message
    );
  }


  // clear the snack bar message once shown
  void clearSnackBarMessage(){
    state = state.copyWith(
      watchlistMessage: WatchlistSnackbarTextEnum.neutral
    );
  }
}
