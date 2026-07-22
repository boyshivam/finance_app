import "package:aprreciate/data/watchlist_data/all_watchlists_provider.dart";
import "package:aprreciate/models/watchlist_models/watchlist_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final allWatchListsProvider =
    NotifierProvider<AllWatchListsNotifier, List<IndividualWatchlistModel>>(
      AllWatchListsNotifier.new,
    );
