import 'package:aprreciate/models/watchlist_models/watchlist_model.dart';

class AllWatchlistsState {
  const AllWatchlistsState({required this.allWatchlistsList});

  final List<IndividualWatchlistModel> allWatchlistsList;

  AllWatchlistsState copyWith({
    String? selectedWatchlistName,
    String? selectedWatchlistId,
    List<IndividualWatchlistModel>? allWatchlistsList,
  }) {
    return AllWatchlistsState(
      allWatchlistsList: allWatchlistsList ?? this.allWatchlistsList,
    );
  }
}
