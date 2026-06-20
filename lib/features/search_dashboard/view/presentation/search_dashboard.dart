import "package:aprreciate/data/search_dashboard_data/search_dashboard_cards.dart";
import "package:aprreciate/features/search_dashboard/view/widgets/recently%20viewed/recently_viewed_section.dart";
import "package:aprreciate/features/search_dashboard/view/widgets/search_bar.dart";
import "package:aprreciate/features/search_dashboard/view/widgets/search_dash_top_section.dart";
import "package:aprreciate/features/search_dashboard/view/widgets/search_tabs.dart";
import "package:aprreciate/models/search_dashboard_models/search_dashboard_card_model.dart";
import "package:flutter/material.dart";

class SearchDashboardScreen extends StatefulWidget {
  const SearchDashboardScreen({super.key});

  @override
  State<SearchDashboardScreen> createState() => _SearchDashboardScreenState();
}

class _SearchDashboardScreenState extends State<SearchDashboardScreen> {
  // index for tab in search dashboard
  int selectedTabIndex = 0;

  bool userSearched = false;

  // focus node for the text field
  final iconFocusNode = FocusNode();

  // store the results of searched stocks
  List<SearchDashboardCardModel> results = [];

  // in case of no search results, toggle
  bool noSearchResults = false;

  // controller for text field
  final searchBarController = TextEditingController();

  // scroll controller
  late ScrollController searchTabController;

  // read entered text
  String get userInput => searchBarController.text;

  // validate search
  List<SearchDashboardCardModel> validateStocks() {
    final query = userInput.toLowerCase();
    return searchDashboardCards
        .where((item) => item.itemName.toLowerCase().contains(query))
        .toList();
  }

  // show search results based on users input
  void showSearchResult() {
    if (validateStocks().isNotEmpty) {
      setState(() {
        results = validateStocks();
        userSearched = validateStocks().isNotEmpty;
        noSearchResults = false;
      });
    } else {
      setState(() {
        noSearchResults = true;
      });
    }
    if (userInput.isEmpty) {
      userSearched = false;
    }
  }

  // clear entered text
  void clearEnteredText() {
    setState(() {
      searchBarController.clear();
      results = [];
      userSearched = false;
      noSearchResults = false;
    });
  }

  // select a tab
  void onSelectTab(int index) {
    setState(() {
      selectedTabIndex = index;
    });
    searchTabController.animateTo(
      index * 150,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchTabController = ScrollController();
    iconFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    iconFocusNode.dispose();
    searchTabController.dispose();
    searchBarController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchDashTopSection(),
          SearchTabs(
            scrollController: searchTabController,
            onSelectTab: onSelectTab,
            selectedTabIndex: selectedTabIndex,
          ),
          SearchBarCustom(
            iconFocusNode: iconFocusNode,
            searchBarController: searchBarController,
            showSearchResults: () {
              showSearchResult();
            },
            clearText: clearEnteredText,
          ),
          RecentlyViewedSection(
            userSearched: userSearched,
            results: results,
            noSearchResults: noSearchResults,
          ),
        ],
      ),
    );
  }
}
