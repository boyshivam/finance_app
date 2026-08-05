import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_search_and%20_add_widgets/existing_watchlist_list_viewer.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/providers/all_watchlists_provider.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/providers/watchlist_dashboard_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class AddToSecurityToWatchlistBottomSheet extends ConsumerWidget {
  const AddToSecurityToWatchlistBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final currentStateOfWatchlists = ref.watch(allWatchListsProvider);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          25,
          20,
          25,
          MediaQuery
              .of(context)
              .padding
              .bottom + 20,
        ),
        child: Column(
          children: [
            Text("Add to watchlist"),
            if (currentStateOfWatchlists.allWatchlistsList.isEmpty)
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  child: Text("No existing watchlists... Create a new one!"),
                ),
              ),
            if(currentStateOfWatchlists.allWatchlistsList.isNotEmpty)
              ExistingWatchlistListViewer()
          ],
        ),
      ),
    );
  }
}
