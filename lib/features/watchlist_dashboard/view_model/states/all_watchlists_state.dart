import 'package:aprreciate/features/watchlist_dashboard/enums/watchlist_snackbar_text_enum.dart';
import 'package:aprreciate/models/watchlist_models/watchlist_model.dart';

class AllWatchlistsState {
  const AllWatchlistsState({
    required this.allWatchlistsList,
    required this.watchlistMessage,
  });

  final List<IndividualWatchlistModel> allWatchlistsList;
  final WatchlistSnackbarTextEnum watchlistMessage;

  AllWatchlistsState copyWith({
    List<IndividualWatchlistModel>? allWatchlistsList,
    WatchlistSnackbarTextEnum? watchlistMessage,
  }) {
    return AllWatchlistsState(
      allWatchlistsList: allWatchlistsList ?? this.allWatchlistsList,
      watchlistMessage: watchlistMessage ?? this.watchlistMessage,
    );
  }
}
