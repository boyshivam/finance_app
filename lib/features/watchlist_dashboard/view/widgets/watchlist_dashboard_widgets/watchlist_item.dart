import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/data/watchlist_data/all_watchlists_provider.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_dashboard_widgets/individual_watchlist_cards_viewer.dart";
import "package:aprreciate/models/watchlist_models/watchlist_model.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class SingleWatchlistItem extends ConsumerWidget {
  const SingleWatchlistItem({super.key, required this.watchlist});

  final IndividualWatchlistModel watchlist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Column(
        children: [
          Row(
            children: [
              Text(watchlist.watchlistName),
              const Spacer(),
              Text("View all"),
            ],
          ),
          const SizedBox(height: 20),
          if (watchlist.securities.isEmpty)
            Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColorsCommon.appWhite,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.inventory_2,
                    size: 60,
                    color: AppColorsCommon.appreciateThemeColor,
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Watchlist is Empty!",
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Keep an eye on your favourite stocks by adding them here.",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            context.push(AppRoutes.watchlistSearchEquity);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                width: 1.5,
                                color: AppColorsCommon.appreciateThemeColor,
                              ),
                            ),
                            child: Text(
                              "Add stock",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          if (watchlist.securities.isNotEmpty)
            IndividualWatchlistCardsViewer()
        ],
      ),
    );
  }
}
