import "package:aprreciate/features/watchlist_dashboard/view/widgets/individual_watchlist_screen_widgets/individual_watchlist_search_edit_bar.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/individual_watchlist_screen_widgets/topsection_individual_watchlist.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/individual_watchlist_screen_widgets/watchlist_securities_viewer.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/providers/all_watchlists_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class IndividualWatchlistScreen extends ConsumerWidget {
  const IndividualWatchlistScreen({
    super.key,
    required this.watchlistHeader,
    required this.watchlistId,
  });

  final String watchlistHeader;
  final String watchlistId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedWatchlistState = ref.watch(allWatchListsProvider);

    return Scaffold(
      body: Column(
        children: [
          TopsectionIndividualWatchlist(watchlistHeader: watchlistHeader),
          IndividualWatchlistSearchEditBar(
            watchlistId: watchlistId,
            watchlistName: watchlistHeader,
          ),
          Expanded(
            child: WatchlistSecuritiesViewer(openedWatchlistId: watchlistId),
          ),
        ],
      ),
    );
  }
}
