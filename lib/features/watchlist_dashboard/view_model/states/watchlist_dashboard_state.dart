import 'package:aprreciate/features/watchlist_dashboard/enums/is_security_favourite_enum.dart';
import 'package:aprreciate/features/watchlist_dashboard/enums/search_result_status_enum.dart';
import 'package:aprreciate/features/watchlist_dashboard/enums/watchlist_createfield_enum.dart';
import 'package:aprreciate/features/watchlist_dashboard/enums/watchlit_tabs_enum.dart';
import 'package:aprreciate/models/stocks_model/stock_card_model.dart';

class WatchlistState {
  WatchlistState({
    required this.selectedTab,
    required this.watchlistName,
    required this.watchlistCreateField,
    required this.searchedSecurity,
    required this.searchResults,
    required this.searchResultsStatus,
    required this.isSecurityFavourite,
  });

  final WatchlistTabsEnum selectedTab;
  final String watchlistName;
  final WatchlistCreateFieldEnum watchlistCreateField;
  final String searchedSecurity;
  List<StockCardModel> searchResults;
  SearchResultStatusEnum searchResultsStatus;
  IsSecurityFavouriteEnum isSecurityFavourite;

  WatchlistState copyWith({
    WatchlistTabsEnum? selectedTab,
    String? watchlistName,
    WatchlistCreateFieldEnum? watchlistCreateField,
    String? searchedSecurity,
    List<StockCardModel>? searchResults,
    SearchResultStatusEnum? searchResultsStatus,
    IsSecurityFavouriteEnum? isSecurityFavourite,
  }) {
    return WatchlistState(
      selectedTab: selectedTab ?? this.selectedTab,
      watchlistName: watchlistName ?? this.watchlistName,
      watchlistCreateField: watchlistCreateField ?? this.watchlistCreateField,
      searchedSecurity: searchedSecurity ?? this.searchedSecurity,
      searchResults: searchResults ?? this.searchResults,
      searchResultsStatus: searchResultsStatus ?? this.searchResultsStatus,
      isSecurityFavourite: isSecurityFavourite ?? this.isSecurityFavourite,
    );
  }
}
