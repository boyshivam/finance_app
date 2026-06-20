import "package:aprreciate/features/search_dashboard/view/widgets/recently%20viewed/recently_viewed_section.dart";
import "package:aprreciate/features/search_dashboard/view/widgets/search_bar.dart";
import "package:aprreciate/features/search_dashboard/view/widgets/search_dash_top_section.dart";
import "package:aprreciate/features/search_dashboard/view/widgets/search_tabs.dart";
import "package:aprreciate/features/search_dashboard/view_model/view_model_searchdashboard.dart";
import "package:flutter/material.dart";

class SearchDashboardScreen extends StatefulWidget {
  const SearchDashboardScreen({super.key});

  @override
  State<SearchDashboardScreen> createState() => _SearchDashboardScreenState();
}

class _SearchDashboardScreenState extends State<SearchDashboardScreen> {

  final vm = ViewModelSearchDashboard();

  // controller for text field
  final searchBarController = TextEditingController();
  final iconFocusNode = FocusNode();
  late ScrollController searchTabController;

  // read entered text
  String get userInput => searchBarController.text;


  //  tabs selection functionality
  void onSelectTab(int index) {
    setState(() {
      vm.selectedTabIndex = index;
    });
    searchTabController.animateTo(
      index * 150,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  // clear the search bar
  void clearEnteredText() {
    setState(() {
      searchBarController.clear();
      vm.clearSearch();
    });
  }

  // initialize controllers and focus nodes
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
            selectedTabIndex: vm.selectedTabIndex,
          ),
          SearchBarCustom(
            iconFocusNode: iconFocusNode,
            searchBarController: searchBarController,
            showSearchResults: () {
              setState(() {
                vm.showSearchResult(userInput);
              });
            },
            clearText: clearEnteredText,
          ),
          RecentlyViewedSection(
            userSearched: vm.userSearched,
            results: vm.results,
            noSearchResults: vm.noSearchResults,
          ),
        ],
      ),
    );
  }
}
