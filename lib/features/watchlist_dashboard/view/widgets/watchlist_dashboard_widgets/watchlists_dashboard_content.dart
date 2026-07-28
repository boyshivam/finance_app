import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_dashboard_widgets/all_watchlists_viewer.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/providers/all_watchlists_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class WatchlistsDashboardContent extends ConsumerWidget {
  const WatchlistsDashboardContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allWatchlistsData = ref.watch(allWatchListsProvider);

    return SizedBox(
      height: 500,
      child: Column(
        children: [
          if (allWatchlistsData.allWatchlistsList.isEmpty)
            Column(
              children: [
                const SizedBox(height: 100,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 65, horizontal: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: AppColorsCommon.appWhite
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.inventory_2,
                          size: 60,
                          color: AppColorsCommon.appreciateThemeColor,
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                          child: Text("All Empty...Create a Watchlist!", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 22
                          ),textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          if(allWatchlistsData.allWatchlistsList.isNotEmpty)
            Expanded(child: AllWatchlistsViewer(allWatchlists: allWatchlistsData.allWatchlistsList))
        ],
      ),
    );
  }
}
