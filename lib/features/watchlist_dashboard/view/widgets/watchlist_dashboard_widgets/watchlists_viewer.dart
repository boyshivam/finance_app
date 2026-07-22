import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_dashboard_widgets/watchlist_item.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/providers/all_watchlists_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class WatchlistsViewer extends ConsumerWidget {
  const WatchlistsViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final allWatchListsData = ref.watch(allWatchListsProvider);

    return ListView.builder(
      itemCount: allWatchListsData.length,
      itemBuilder: (context, index) =>
          SingleWatchlistItem(watchlist: allWatchListsData[index]),
    );
  }
}
