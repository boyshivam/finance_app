import "package:aprreciate/core/constants/app_assets/app_assets_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/watchlist_dashboard/enums/search_result_status_enum.dart";
import "package:aprreciate/features/watchlist_dashboard/enums/watchlist_snackbar_text_enum.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_search_and%20_add_widgets/search_results_viewer.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/providers/all_watchlists_provider.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/providers/watchlist_dashboard_provider.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

class SearchSecurityScreen extends ConsumerStatefulWidget {
  const SearchSecurityScreen({
    super.key,
    required this.watchlistId,
    required this.descendantOfWatchlist,
    required this.watchlistName,
  });

  final String watchlistId;
  final bool descendantOfWatchlist;
  final String watchlistName;

  @override
  ConsumerState<SearchSecurityScreen> createState() =>
      _SearchSecurityScreenState();
}

class _SearchSecurityScreenState extends ConsumerState<SearchSecurityScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ref.listenManual(
      allWatchListsProvider.select((state) => state.watchlistMessage),
      (previous, next) {
        if (next == WatchlistSnackbarTextEnum.added) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(

              content: Text("Security added!"),
              duration: Duration(seconds: 2),
              backgroundColor: AppColorsCommon.appreciateThemeColor,
            ),
          );
          final notifier = ref.read(allWatchListsProvider.notifier);
          notifier.clearSnackBarMessage();
        } else if (next == WatchlistSnackbarTextEnum.removed) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Security removed!"),
              duration: Duration(seconds: 1),
              backgroundColor: AppColorsCommon.appreciateThemeColor,
            ),
          );
          final notifier = ref.read(allWatchListsProvider.notifier);
          notifier.clearSnackBarMessage();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final vmState = ref.watch(watchlistDashboardProvider);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          25,
          MediaQuery.of(context).padding.top + 16,
          25,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                context.pop(AppRoutes.watchlistDashboardScreen);
              },
              child: Image.asset(
                AppAssetsCommon.generic_back_cta,
                width: 35,
                height: 35,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Search and add",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 26,
              ),
            ),
            SizedBox(height: 15),
            // search bar
            SizedBox(
              height: 80,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        color: AppColorsCommon.appWhite,
                        border: Border.all(
                          color: AppColorsCommon.appreciateThemeColor,
                          width: 2,
                        ),
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search, size: 20),
                        ),
                        onChanged: (value) {
                          final watchlistNotifier = ref.read(
                            watchlistDashboardProvider.notifier,
                          );
                          watchlistNotifier.deriveSearchedSecurity(value);
                          watchlistNotifier.searchSecurity(value);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),

            if (vmState.searchResultsStatus == SearchResultStatusEnum.empty)
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.grey,
                        ),
                        child: Text(
                          "Search for a security...",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                color: AppColorsCommon.appWhite,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (vmState.searchResultsStatus == SearchResultStatusEnum.noResults)
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.grey,
                        ),
                        child: Text(
                          "No search results found...",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                color: AppColorsCommon.appWhite,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (vmState.searchResultsStatus ==
                SearchResultStatusEnum.resultsFound)
              Expanded(
                child: SearchResultsViewer(
                  watchlistId: widget.watchlistId,
                  descendantOfWatchlist: widget.descendantOfWatchlist,
                ),
              ),
          ],
        ),
      ),
      backgroundColor: AppColorsCommon.scaffoldBackGroundColor,
    );
  }
}
