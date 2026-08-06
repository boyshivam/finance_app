import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/providers/all_watchlists_provider.dart";
import "package:aprreciate/models/stocks_model/stock_card_model.dart";
import "package:aprreciate/models/watchlist_models/watchlist_model.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class AddToWatchlistBottomSheetCard extends ConsumerWidget {
  const AddToWatchlistBottomSheetCard({
    super.key,
    required this.watchlistItem,
    required this.security,
  });

  final IndividualWatchlistModel watchlistItem;
  final StockCardModel security;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final securityExistsInWatchlist = watchlistItem.securities.contains(
      security,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(0xFFC1DAEA),
          border: Border.all(
            width: 1.5,
            color: AppColorsCommon.inactiveTextFieldBorderColor,
          ),
        ),
        child: Row(
          children: [
            Text(watchlistItem.watchlistName),
            const Spacer(),
            Checkbox(
              value: securityExistsInWatchlist,
              onChanged: (checked) {
                if (checked == true) {
                  ref
                      .read(allWatchListsProvider.notifier)
                      .manipulateWatchlistSecurities(
                      watchlistId: watchlistItem.watchlistId,
                      security: security);
                }else{
                  ref
                      .read(allWatchListsProvider.notifier)
                      .manipulateWatchlistSecurities(
                      watchlistId: watchlistItem.watchlistId,
                      security: security);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
