import 'package:aprreciate/models/watchlist_models/watchlist_model.dart';

class AllWatchlistsState {
  const AllWatchlistsState({
    required this.selectedWatchlistName,
    required this.selectedWatchlistId,
    required this.allWatchlistsList,
  });

  final String selectedWatchlistName;
  final String selectedWatchlistId;
  final List<IndividualWatchlistModel> allWatchlistsList;

  AllWatchlistsState copyWith({
    String? selectedWatchlistName,
    String? selectedWatchlistId,
    List<IndividualWatchlistModel>? allWatchlistsList,
  }) {
    return AllWatchlistsState(
      selectedWatchlistId: selectedWatchlistId ?? this.selectedWatchlistId,
      selectedWatchlistName: selectedWatchlistName ?? this.selectedWatchlistName,
      allWatchlistsList: allWatchlistsList ?? this.allWatchlistsList,
    );
  }
}
