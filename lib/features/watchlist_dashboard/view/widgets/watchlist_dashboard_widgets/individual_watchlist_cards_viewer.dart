import "package:aprreciate/data/watchlist_data/securities_per_watchlist_data.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_dashboard_widgets/individual_watchlist_card.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class IndividualWatchlistCardsViewer extends ConsumerWidget {
  const IndividualWatchlistCardsViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final securitiesProvider = ref.watch(securitiesPerWatchlistProvider);

    return SizedBox(
      height: 200,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: securitiesProvider.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.8,
        ),
        itemBuilder: (context, index) =>
            IndividualWatchlistCard(watchlistCard: securitiesProvider[index]),
      ),
    );
  }
}
