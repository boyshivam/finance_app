import "package:aprreciate/features/search_dashboard/view/widgets/recently%20viewed/recently_viewed_section.dart";
import "package:aprreciate/features/search_dashboard/view/widgets/search_bar.dart";
import "package:aprreciate/features/search_dashboard/view/widgets/search_dash_top_section.dart";
import "package:aprreciate/features/search_dashboard/view/widgets/search_tabs.dart";
import "package:aprreciate/features/search_dashboard/view_model/search_dashboard_provider/search_dashboard_provider.dart";
import "package:aprreciate/features/search_dashboard/view_model/view_model_searchdashboard.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:riverpod/riverpod.dart";
import "package:flutter/material.dart";

class SearchDashboardScreen extends ConsumerStatefulWidget {
  const SearchDashboardScreen({super.key});

  @override
  ConsumerState<SearchDashboardScreen> createState() => _SearchDashboardScreenState();
}

class _SearchDashboardScreenState extends ConsumerState<SearchDashboardScreen> {


  // controllers and focus nodes
  late FocusNode selectTabFocus;
  late ScrollController tabScrollControl;
  late TextEditingController searchBarTextControl;

  // get user input
  String get userInput => searchBarTextControl.text;




  void onSelectTab(int index){
    ref.read(searchDashboardProvider.notifier).changeSelectedTab(index);
  }

  void checkSearchResult(){
    ref.read(searchDashboardProvider.notifier).showSearchResults(userInput);
  }


  void clearEnteredText(){
    searchBarTextControl.clear();
    ref.read(searchDashboardProvider.notifier).clearSearch();

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

    final vm = ref.watch(searchDashboardProvider);

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
            searchState: vm.searchState,
            userInput: vm.userInputState,
            results: vm.searchResults,

          ),
        ],
      ),
    );
  }
}
