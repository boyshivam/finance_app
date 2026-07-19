import "package:aprreciate/data/watchlist_data/watchlist_items_data.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_dashboard_widgets/watchlist_item.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class WatchlistsViewer extends ConsumerWidget {
  const WatchlistsViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchListData = ref.watch(watchListItemsDataProvider);

    return ListView.builder(
      itemCount: watchListData.length,
      itemBuilder: (context, index) =>
          WatchlistItem(watchlist: watchListData[index]),
    );
  }
}
