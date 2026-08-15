import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/search_dashboard/view/widgets/recently%20viewed/recently_viewed_section.dart";
import "package:aprreciate/features/search_dashboard/view/widgets/search_bar.dart";
import "package:aprreciate/features/search_dashboard/view/widgets/search_dash_top_section.dart";
import "package:aprreciate/features/search_dashboard/view/widgets/search_tabs.dart";
import "package:aprreciate/features/search_dashboard/view_model/search_dashboard_provider/search_dashboard_provider.dart";
import "package:aprreciate/features/watchlist_dashboard/enums/watchlist_snackbar_text_enum.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/providers/all_watchlists_provider.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter/material.dart";

class SearchDashboardScreen extends ConsumerStatefulWidget {
  const SearchDashboardScreen({super.key});

  @override
  ConsumerState<SearchDashboardScreen> createState() =>
      _SearchDashboardScreenState();
}

class _SearchDashboardScreenState extends ConsumerState<SearchDashboardScreen> {
  // controllers and focus nodes
  late FocusNode selectTabFocus;
  late ScrollController tabScrollControl;
  late TextEditingController searchBarTextControl;

  // get user input
  String get userInput => searchBarTextControl.text;

  void onSelectTab(int index) {
    ref.read(searchDashboardProvider.notifier).changeSelectedTab(index);
  }

  void checkSearchResult() {
    ref.read(searchDashboardProvider.notifier).showSearchResults(userInput);
  }

  void clearEnteredText() {
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

    ref.listenManual(
      (allWatchListsProvider.select((state) => state.watchlistMessage)),
      (previous, next) {
        if (next == WatchlistSnackbarTextEnum.added) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Security added!"),
              duration: Duration(seconds: 2),
              backgroundColor: AppColorsCommon.appreciateThemeColor,
            ),
          );
          final watchlistNotifier = ref.read(allWatchListsProvider.notifier);
          watchlistNotifier.clearSnackBarMessage();
        }
        if (next == WatchlistSnackbarTextEnum.removed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Security removed!"),
              duration: Duration(seconds: 2),
              backgroundColor: AppColorsCommon.appreciateThemeColor,
            ),
          );
          final watchlistNotifier = ref.read(allWatchListsProvider.notifier);
          watchlistNotifier.clearSnackBarMessage();
        }
      },
    );
  }

  @override
  void dispose() {
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
            showSearchResults: () {
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
