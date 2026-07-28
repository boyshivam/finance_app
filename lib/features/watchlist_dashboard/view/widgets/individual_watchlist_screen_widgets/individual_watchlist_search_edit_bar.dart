import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/providers/watchlist_dashboard_provider.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

class IndividualWatchlistSearchEditBar extends ConsumerWidget {
  const IndividualWatchlistSearchEditBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchlistDashboardNotifier = ref.read(
      watchlistDashboardProvider.notifier,
    );



    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 260,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: AppColorsCommon.appWhite,
              ),
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon:  Icon(Icons.search, size: 16),
                ),
                onTap: (){
                  context.push(AppRoutes.watchlistSearchEquity);
                },
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                      "Edit",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
      ),
    );
  }
}
