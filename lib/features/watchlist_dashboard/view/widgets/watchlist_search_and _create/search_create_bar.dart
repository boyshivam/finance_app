import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/providers/watchlist_dashboard_provider.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

class SearchCreateBar extends ConsumerWidget {
  const SearchCreateBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmState = ref.read(watchlistProvider);

    final notifier = ref.read(watchlistProvider.notifier);

    return SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: AppColorsCommon.appWhite,
            ),
            child: TextField(
              decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, size: 16),
              ),
              onTap: (){
                context.push(AppRoutes.watchlistSearchEquity);
              },
            ),
          ),
          const SizedBox(width: 20),
          InkWell(
            onTap: () {
              notifier.createWatchlistBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: AppColorsCommon.appreciateThemeColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.add_circle_outline_sharp,
                    size: 16,
                    color: AppColorsCommon.appWhite,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Create",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColorsCommon.appWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
