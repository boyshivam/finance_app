import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/watchlist_provider.dart";
import "package:aprreciate/models/watchlist_models/watchlist_tab_model.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class WatchlistTabPill extends ConsumerWidget {
  const WatchlistTabPill({super.key, required this.item});

  final WatchlistTabsModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmState = ref.watch(watchlistProvider);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
        color: vmState.selectedTab == item.tab
            ? AppColorsCommon.appreciateThemeColor
            : AppColorsCommon.appWhite,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        children: [
          Text(
            item.tabName,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: vmState.selectedTab == item.tab
                  ? AppColorsCommon.appWhite
                  : Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
