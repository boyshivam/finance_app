import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/data/watchlist_data/watchlist_tabs_data.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_tab_widgets/watchlist_tab_pill.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/watchlist_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class WatchlistTabs extends ConsumerWidget {
  const WatchlistTabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 60,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        color: AppColorsCommon.appWhite,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, _) => SizedBox(width: 30),
          itemCount: watchlistTabsData.length,
          itemBuilder: (context, index) {
            final item = watchlistTabsData[index].tab;

            return InkWell(
              onTap: () {
                ref.read(watchlistProvider.notifier).changeTab(item);
              },
              child: WatchlistTabPill(item: watchlistTabsData[index]),
            );
          },
        ),
      ),
    );
  }
}
