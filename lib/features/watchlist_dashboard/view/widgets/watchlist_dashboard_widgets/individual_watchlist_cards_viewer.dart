import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_dashboard_widgets/individual_watchlist_card.dart";
import "package:aprreciate/models/watchlist_models/watchlist_model.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class IndividualWatchlistCardsViewer extends ConsumerWidget {
  const IndividualWatchlistCardsViewer({super.key, required this.watchlist});

  final IndividualWatchlistModel watchlist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 270,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: watchlist.securities.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          mainAxisExtent: 220,

        ),
        itemBuilder: (context, index) =>
            IndividualWatchlistCard(watchlistCard: watchlist.securities[index], watchlistId: watchlist.watchlistId,),
      ),
    );
  }
}
