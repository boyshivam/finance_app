import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_dashboard_widgets/watchlists_dashboard_content.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_search_and%20_create/search_create_bar.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_top_section/top_section.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_tab_widgets/watchlist_tabs.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class WatchlistDashboard extends ConsumerWidget {
  const WatchlistDashboard({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Container(
      child: Column(
        children: [
          WatchlistTopSection(),
          const SizedBox(height: 1,),
          WatchlistTabs(),
          SearchCreateBar(),
          Expanded(child: WatchlistsDashboardContent())
        ],
      ),
    );
  }
}
