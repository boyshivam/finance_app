import "package:aprreciate/models/watchlist_models/watchlist_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class WatchListItemsDataNotifier extends Notifier<List<WatchlistModel>> {
  @override
  List<WatchlistModel> build() => [];

  // add new watchlist
  void addWatchlist(WatchlistModel watchlist) {
    state = [...state, watchlist];
  }
}

final watchListItemsDataProvider =
    NotifierProvider<WatchListItemsDataNotifier, List<WatchlistModel>>(
      WatchListItemsDataNotifier.new,
    );
