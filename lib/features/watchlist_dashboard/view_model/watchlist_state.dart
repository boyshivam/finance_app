import 'package:aprreciate/features/watchlist_dashboard/enums/watchlit_tabs_enum.dart';

class WatchlistState {
  const WatchlistState({required this.selectedTab});

  final WatchlistTabsEnum selectedTab;

  WatchlistState copyWith({WatchlistTabsEnum? selectedTab}) {
    return WatchlistState(selectedTab: selectedTab ?? this.selectedTab);
  }
}
