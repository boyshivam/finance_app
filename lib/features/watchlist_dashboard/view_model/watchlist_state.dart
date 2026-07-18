import 'package:aprreciate/features/watchlist_dashboard/enums/watchlit_tabs_enum.dart';

class WatchlistState {
  const WatchlistState({
    required this.selectedTab,
    required this.watchlistName,
  });

  final WatchlistTabsEnum selectedTab;
  final String watchlistName;

  WatchlistState copyWith({
    WatchlistTabsEnum? selectedTab,
    String? watchlistName,
  }) {
    return WatchlistState(
      selectedTab: selectedTab ?? this.selectedTab,
      watchlistName: watchlistName ?? this.watchlistName,
    );
  }
}
