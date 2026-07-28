import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_dashboard_widgets/individual_watchlist_card.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/providers/all_watchlists_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class WatchlistSecuritiesViewer extends ConsumerWidget {
  const WatchlistSecuritiesViewer({super.key, required this.openedWatchlistId});

  final String openedWatchlistId;


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allWatchlists = ref.watch(allWatchListsProvider);

    final openWatchlist = allWatchlists.allWatchlistsList.firstWhere((
        watchlist) => watchlist.watchlistId == openedWatchlistId);

    final stocksOfOpenList = openWatchlist.securities;

    return ListView.builder(
        itemCount: stocksOfOpenList.length,
        itemBuilder: (context, index) =>
            IndividualWatchlistCard(watchlistCard: stocksOfOpenList[index])
    );
  }
}
