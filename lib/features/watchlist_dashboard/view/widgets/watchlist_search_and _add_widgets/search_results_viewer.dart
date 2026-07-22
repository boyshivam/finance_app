import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_search_and%20_add_widgets/search_result_card.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/providers/watchlist_dashboard_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class SearchResultsViewer extends ConsumerWidget {
  const SearchResultsViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchResults = ref.watch(watchlistProvider).searchResults;

    return SizedBox(
      height: 450,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: searchResults.length,
        itemBuilder: (context, index) =>
            SearchResultCard(security: searchResults[index]),
      ),
    );
  }
}
