import 'package:aprreciate/data/search_dashboard_data/search_dashboard_cards.dart';
import 'package:aprreciate/features/search_dashboard/enums/search_enums.dart';
import 'package:aprreciate/features/search_dashboard/enums/user_input_enum.dart';
import 'package:aprreciate/features/search_dashboard/view_model/search_state/search_state.dart';
import 'package:aprreciate/models/search_dashboard_models/search_dashboard_card_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchDashboardNotifier extends Notifier<SearchDashboardState> {

  @override
  SearchDashboardState build() {
    // TODO: implement build
    return SearchDashboardState(selectedTabIndex: 0,
        searchState: SearchResultState.empty,
        userInputState: UserInputState.notEnteredInput,
        searchResults: []);
  }

  // validate if user's input has a match in database
  List<SearchDashboardCardModel> validateSearchQuery(String input) {
    final query = input.toLowerCase();
    return searchDashboardCards
        .where((stock) => stock.itemName.toLowerCase().contains(query))
        .toList();
  }

  // show search result for valid query
  void showSearchResults(String input) {
    if (input.isEmpty) {
      state = state.copyWith(
          searchResults: [],
          searchState: SearchResultState.empty,
          userInputState: UserInputState.notEnteredInput
      );
      return;
    }

    final results = validateSearchQuery(input);

    state = state.copyWith(
        searchResults: results,
        searchState: results.isEmpty
            ? SearchResultState.gotNoResults
            : SearchResultState.gotResult,
        userInputState: UserInputState.enteredInput

    );
  }

  // clear all input from the search bar
  void clearSearch() {
    state = state.copyWith(
      searchResults: [],
      searchState: SearchResultState.empty,
      userInputState: UserInputState.notEnteredInput,

    );
  }

  // update index of selected tab
  void changeSelectedTab(int index) {
    state = state.copyWith(
        selectedTabIndex: index
    );
  }

}