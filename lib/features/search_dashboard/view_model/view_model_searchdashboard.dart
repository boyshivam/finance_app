import 'package:aprreciate/data/search_dashboard_data/search_dashboard_cards.dart';
import 'package:aprreciate/models/search_dashboard_models/search_dashboard_card_model.dart';

class ViewModelSearchDashboard {


  // index of the current selected tab
  int selectedTabIndex = 0;

  // did user search anything
  bool userSearched = false;

  // if any match for users query
  bool noSearchResult = false;

  // store the matched search result
  List<SearchDashboardCardModel> searchResults = [];

  // validate of user's input has a match in database
  List<SearchDashboardCardModel> validateSearchQuery(String input) {
    final query = input.toLowerCase();
    return searchDashboardCards
        .where((stock) => stock.itemName.toLowerCase().contains(query))
        .toList();
  }

  // show search result for valid query
  void showSearchResults(String input){

    if(input.isEmpty){
      searchResults = [];
      userSearched = false;
      noSearchResult = false;
      return;
    }
    searchResults = validateSearchQuery(input);
    userSearched = validateSearchQuery(input).isNotEmpty;
    noSearchResult = searchResults.isEmpty;

  }


  void clearSearch(){
    searchResults = [];
    noSearchResult = false;
    userSearched = false;
  }


}
