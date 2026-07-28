

class IndividualWatchlistArgs {
  const IndividualWatchlistArgs ({
    required this.watchlistName,
    required this.watchlistId,
    required this.descendantOfWatchlist
});

  final String watchlistName;
  final String watchlistId;
  final bool descendantOfWatchlist;
}