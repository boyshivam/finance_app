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

  // controllers and focus nodes
  late FocusNode selectTabFocus;
  late ScrollController tabScrollControl;
  late TextEditingController searchBarTextControl;

  // get user input
  String get userInput => searchBarTextControl.text;

  // validate user input


  void onSelectTab(int index){
    setState(() {
      vm.selectedTabIndex = index;
    });
  }

  void checkSearchResult(){
    setState(() {
      vm.showSearchResults(userInput);
    });
  }


  void clearEnteredText(){
    setState(() {
      searchBarTextControl.clear();
      vm.clearSearch();
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectTabFocus = FocusNode();
    tabScrollControl = ScrollController();
    searchBarTextControl = TextEditingController();
  }


  @override
  void dispose(){
    selectTabFocus.dispose();
    tabScrollControl.dispose();
    searchBarTextControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchDashTopSection(),
          SearchTabs(
            scrollController: tabScrollControl,
            onSelectTab: onSelectTab,
            selectedTabIndex: vm.selectedTabIndex,
          ),
          SearchBarCustom(
            iconFocusNode: selectTabFocus,
            searchBarController: searchBarTextControl,
            showSearchResults: (){
              checkSearchResult();
            },
            clearText: clearEnteredText,
          ),
          RecentlyViewedSection(
            userSearched: vm.userSearched,
            results: vm.searchResults,
            noSearchResults: vm.noSearchResult,
          ),
        ],
      ),
    );
  }
}
