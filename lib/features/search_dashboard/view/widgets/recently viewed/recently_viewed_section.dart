import "package:aprreciate/core/constants/app_assets/assets_search_dashboard/assets_search_dashboard.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/data/search_dashboard_data/search_dashboard_cards.dart";
import "package:aprreciate/features/search_dashboard/enums/search_enums.dart";
import "package:aprreciate/features/search_dashboard/enums/user_input_enum.dart";
import "package:aprreciate/features/search_dashboard/view/widgets/recently%20viewed/recently_viewed_cards.dart";
import "package:aprreciate/features/search_dashboard/view_model/search_state/search_state.dart";
import "package:aprreciate/models/search_dashboard_models/search_dashboard_card_model.dart";
import "package:flutter/material.dart";

class RecentlyViewedSection extends StatelessWidget {
  const RecentlyViewedSection({
    super.key,
    required this.searchState,
    required this.results,
    required this.userInput

  });

  final SearchResultState searchState;
  final UserInputState userInput;
  final List<SearchDashboardCardModel> results;


  @override
  Widget build(BuildContext context) {

    final userSearched = userInput == UserInputState.enteredInput;
    final noSearchResults = searchState == SearchResultState.gotNoResults;

    return Container(
      margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Text(
                  userSearched ? "Results" : "Recently viewed",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const Spacer(),
                Text(
                  userSearched ? "Filters" : "View all",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: AppColorsCommon.appreciateThemeColor,
                  ),
                ),
              ],
            ),
          ),
          if(noSearchResults)
            SizedBox(
              height: 400,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AssetsSearchDashboard.noSearchResultsIcon, width: 80, height: 80,),
                    const SizedBox(height: 10,),
                    Text("No search results"),
                  ],
                ),
              ),
            )else
            RecentlyViewedList(
                items: userSearched ? results : searchDashboardCards,
              ),
        ],
      ),
    );
  }
}
