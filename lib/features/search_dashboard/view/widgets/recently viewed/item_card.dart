import "package:aprreciate/core/constants/app_assets/app_assets_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_search_and%20_add_widgets/add_to_security_to_watchlist_bottomsheet.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/providers/all_watchlists_provider.dart";
import "package:aprreciate/models/stocks_model/stock_card_model.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class ItemCard extends ConsumerWidget {
  const ItemCard({super.key, required this.security, required this.liked});

  final StockCardModel security;
  final bool liked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allWatchlists = ref.watch(allWatchListsProvider);

    final securityExists = allWatchlists.allWatchlistsList.any(
      (watchlist) => watchlist.securities.contains(security),
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColorsCommon.appWhite,
      ),
      child: Row(
        children: [
          Image.asset(security.stockIcon, width: 30, height: 30),
          const SizedBox(width: 50),
          Column(
            children: [
              Text(
                security.stockSymbol,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                security.stockName,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w300),
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Text("Stock"),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (builder) =>
                        AddToSecurityToWatchlistBottomSheet(security: security),
                  );
                },
                child: Image.asset(
                  securityExists
                      ? AppAssetsCommon.likedHeart
                      : AppAssetsCommon.emptyHeart,
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
