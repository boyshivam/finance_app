import "package:aprreciate/features/watchlist_dashboard/view/widgets/individual_watchlist_screen_widgets/individual_watchlist_search_edit_bar.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/individual_watchlist_screen_widgets/topsection_individual_watchlist.dart";
import "package:flutter/material.dart";

class IndividualWatchlistScreen extends StatelessWidget {
  const IndividualWatchlistScreen({super.key, required this.watchlistHeader});

  final String watchlistHeader;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopsectionIndividualWatchlist(watchlistHeader: watchlistHeader),
          IndividualWatchlistSearchEditBar()

          // SearchAndEditWatchlist(),
          // SecuritiesViewer()
        ],
      ),
    );
  }
}
