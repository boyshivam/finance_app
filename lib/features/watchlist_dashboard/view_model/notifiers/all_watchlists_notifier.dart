import "package:aprreciate/models/watchlist_models/watchlist_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class AllWatchListsNotifier extends Notifier<List<IndividualWatchlistModel>> {
  @override
  List<IndividualWatchlistModel> build() => [];

  // add new watchlist
  void addWatchlist(IndividualWatchlistModel watchlist) {
    state = [...state, watchlist];
  }

  // add stock to watchlist
  void addSecurityToWatchlist({
    required String watchlistId,
    required security,
  }) {
    state = state.map((watchlist) {
      if (watchlist.watchlistId == watchlistId) {
        return watchlist.copyWith(
          securities: [...watchlist.securities, security],
        );
      }
      return watchlist;
    }).toList();
  }
}
