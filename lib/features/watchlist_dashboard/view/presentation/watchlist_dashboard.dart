import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_search_and%20_create/search_create_bar.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_top_section/top_section.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_tab_widgets/watchlist_tabs.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_dashboard_widgets/all_watchlists_viewer.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/providers/all_watchlists_provider.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/providers/watchlist_dashboard_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class WatchlistDashboard extends ConsumerWidget {
  const WatchlistDashboard({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final allWatchlists = ref.watch(allWatchListsProvider);

    return Container(
      child: Column(
        children: [
          WatchlistTopSection(),
          const SizedBox(height: 1,),
          WatchlistTabs(),
          SearchCreateBar(),
          Expanded(child: AllWatchlistsViewer(allWatchlists: allWatchlists))
        ],
      ),
    );
  }
}
