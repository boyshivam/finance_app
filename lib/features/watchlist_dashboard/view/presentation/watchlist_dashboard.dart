import "package:aprreciate/features/watchlist_dashboard/view/widgets/search_create_bar.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/top_section.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_tabs.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_viewer.dart";
import "package:flutter/material.dart";

class WatchlistDashboard extends StatelessWidget {
  const WatchlistDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          WatchlistTopSection(),
          const SizedBox(height: 1,),
          WatchlistTabs(),
          SearchCreateBar(),
          Expanded(child: WatchlistsViewer())
        ],
      ),
    );
  }
}
