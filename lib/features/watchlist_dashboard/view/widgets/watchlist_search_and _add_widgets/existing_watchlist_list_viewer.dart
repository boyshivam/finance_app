import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_search_and%20_add_widgets/add_to_watchlist_bottom_sheet_card.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/providers/all_watchlists_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class ExistingWatchlistListViewer extends ConsumerWidget {
  const ExistingWatchlistListViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final existingWatchlists = ref
        .watch(allWatchListsProvider)
        .allWatchlistsList;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: ListView.builder(
        itemCount: existingWatchlists.length,
        itemBuilder: (context, index) => AddToWatchlistBottomSheetCard(
          watchlistItem: existingWatchlists[index],
        ),
      ),
    );
  }
}
