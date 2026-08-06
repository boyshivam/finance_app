import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_search_and%20_add_widgets/existing_watchlist_list_viewer.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/providers/all_watchlists_provider.dart";
import "package:aprreciate/models/stocks_model/stock_card_model.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class AddToSecurityToWatchlistBottomSheet extends ConsumerWidget {
  const AddToSecurityToWatchlistBottomSheet({
    super.key,
    required this.security,
  });

  final StockCardModel security;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allWatchlists = ref.watch(allWatchListsProvider);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          25,
          20,
          25,
          MediaQuery.of(context).padding.bottom + 20,
        ),
        child: Column(
          children: [
            Text(
              "Add to watchlist",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
            ),
            if (allWatchlists.allWatchlistsList.isEmpty)
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  child: Text("No existing watchlists... Create a new one!"),
                ),
              ),
            if (allWatchlists.allWatchlistsList.isNotEmpty)
              ExistingWatchlistListViewer(security: security),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColorsCommon.appreciateThemeColor,
                ),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "Confirm",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColorsCommon.appWhite,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
