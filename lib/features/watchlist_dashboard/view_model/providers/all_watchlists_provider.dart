import "package:aprreciate/features/watchlist_dashboard/view_model/notifiers/all_watchlists_notifier.dart";
import "package:aprreciate/models/watchlist_models/watchlist_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final allWatchListsProvider =
    NotifierProvider<AllWatchListsNotifier, List<IndividualWatchlistModel>>(
      AllWatchListsNotifier.new,
    );
