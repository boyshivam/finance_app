import "package:aprreciate/features/watchlist_dashboard/view_model/notifiers/all_watchlists_notifier.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/states/all_watchlists_state.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final allWatchListsProvider =
    NotifierProvider<AllWatchListsNotifier, AllWatchlistsState>(
      AllWatchListsNotifier.new,
    );
