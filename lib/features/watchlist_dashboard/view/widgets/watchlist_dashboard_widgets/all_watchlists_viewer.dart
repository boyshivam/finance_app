import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_dashboard_widgets/individual_watchlist.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/providers/all_watchlists_provider.dart";
import "package:aprreciate/models/watchlist_models/watchlist_model.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class AllWatchlistsViewer extends ConsumerWidget {
  const AllWatchlistsViewer({super.key, required this.allWatchlists});

  final List<IndividualWatchlistModel> allWatchlists;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allWatchLists = ref.watch(allWatchListsProvider);

    return ListView.builder(
      itemCount: allWatchLists.allWatchlistsList.length,
      itemBuilder: (context, index) =>
          IndividualWatchlistSection(watchlist: allWatchlists[index]),
    );
  }
}
