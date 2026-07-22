import 'package:aprreciate/core/constants/app_assets/app_assets_common.dart';
import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart';
import 'package:aprreciate/features/watchlist_dashboard/enums/is_security_favourite_enum.dart';
import 'package:aprreciate/features/watchlist_dashboard/view_model/providers/watchlist_dashboard_provider.dart';
import 'package:aprreciate/models/stocks_model/stock_card_model.dart';
import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

class SearchResultCard extends ConsumerWidget {
  const SearchResultCard({super.key, required this.security});

  final StockCardModel security;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmState = ref.watch(watchlistProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        decoration: BoxDecoration(
          color: AppColorsCommon.appWhite,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Row(
              children: [
                Image.asset(security.stockIcon, width: 30, height: 30),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      security.stockSymbol,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      security.stockName,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Text("Security"),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () {
                    final notifier = ref.read(watchlistProvider.notifier);
                    notifier.toggleSecurityAsFavourite();
                  },
                  child: Image.asset(
                    vmState.isSecurityFavourite == IsSecurityFavouriteEnum.fav
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
      ),
    );
  }
}
