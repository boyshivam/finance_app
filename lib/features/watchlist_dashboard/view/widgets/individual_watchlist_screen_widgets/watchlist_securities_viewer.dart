import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
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

    final openWatchlist = allWatchlists.allWatchlistsList.firstWhere(
      (watchlist) => watchlist.watchlistId == openedWatchlistId,
    );

    final stocksOfOpenList = openWatchlist.securities;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          if (stocksOfOpenList.isEmpty)
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 25,
                ),
                decoration: BoxDecoration(
                  color: AppColorsCommon.appWhite,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColorsCommon.inactiveTextFieldBorderColor
                  )
                ),

                child: Align(
                  alignment: Alignment.center,
                  child: Text("Watchlist is empty..."),
                ),
              ),
            ),
          if (stocksOfOpenList.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: stocksOfOpenList.length,
                itemBuilder: (context, index) => IndividualWatchlistCard(
                  watchlistCard: stocksOfOpenList[index],
                  watchlistId: openedWatchlistId,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
