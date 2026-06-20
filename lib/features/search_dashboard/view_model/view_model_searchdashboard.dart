

import 'package:aprreciate/data/search_dashboard_data/search_dashboard_cards.dart';
import 'package:aprreciate/models/search_dashboard_models/search_dashboard_card_model.dart';

class ViewModelSearchDashboard {

  // index for tab in search dashboard
  int selectedTabIndex = 0;

  // if user searched
  bool userSearched = false;

  // store the results of searched stocks
  List<SearchDashboardCardModel> results = [];

  // in case of no search results, toggle
  bool noSearchResults = false;

  // validate search
  List<SearchDashboardCardModel> validateStocks(String query) {
    return searchDashboardCards
        .where((item) => item.itemName.toLowerCase().contains(query))
        .toList();
  }

  // show search results based on users input
  void showSearchResult(String query) {
    if(query.isEmpty){
      results = [];
      userSearched = false;
      noSearchResults = false;
      return;
    }

    results = validateStocks(query);
    userSearched = true;
    noSearchResults = results.isEmpty;
  }


  void clearSearch() {
    results = [];
    userSearched = false;
    noSearchResults = false;
  }

}