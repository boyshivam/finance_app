import 'package:aprreciate/features/watchlist_dashboard/enums/watchlist_createfield_enum.dart';
import 'package:aprreciate/features/watchlist_dashboard/enums/watchlit_tabs_enum.dart';

class WatchlistState {
  const WatchlistState({
    required this.selectedTab,
    required this.watchlistName,
    required this.watchlistCreateField,
  });

  final WatchlistTabsEnum selectedTab;
  final String watchlistName;
  final WatchlistCreateFieldEnum watchlistCreateField;

  WatchlistState copyWith({
    WatchlistTabsEnum? selectedTab,
    String? watchlistName,
    WatchlistCreateFieldEnum? watchlistCreateField,
  }) {
    return WatchlistState(
      selectedTab: selectedTab ?? this.selectedTab,
      watchlistName: watchlistName ?? this.watchlistName,
      watchlistCreateField: watchlistCreateField ?? this.watchlistCreateField,
    );
  }
}
