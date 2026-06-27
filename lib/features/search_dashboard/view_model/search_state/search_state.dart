import 'package:aprreciate/features/search_dashboard/enums/search_enums.dart';
import 'package:aprreciate/features/search_dashboard/enums/user_input_enum.dart';
import 'package:aprreciate/models/search_dashboard_models/search_dashboard_card_model.dart';

class SearchDashboardState {
  const SearchDashboardState({
    required this.selectedTabIndex,
    required this.searchState,
    required this.userInputState,
    required this.searchResults,

  });

  final int selectedTabIndex;
  final SearchResultState searchState;
  final UserInputState userInputState;
  final List<SearchDashboardCardModel> searchResults;

  SearchDashboardState copyWith({
    int? selectedTabIndex,
    SearchResultState? searchState,
    UserInputState? userInputState,
    List<SearchDashboardCardModel>? searchResults,
  }){
    return SearchDashboardState(
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      searchState:  searchState ?? this.searchState,
      userInputState: userInputState ?? this.userInputState,
      searchResults: searchResults ?? this.searchResults
    );
  }

}