import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/core/utils/helper_widgets/custom_top_section.dart";
import "package:aprreciate/core/utils/helper_widgets/header_text_helper.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_dashboard_widgets/watchlists_dashboard_content.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_search_and%20_create/search_create_bar.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_top_section/top_section.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_tab_widgets/watchlist_tabs.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class WatchlistDashboard extends ConsumerWidget {
  const WatchlistDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColorsCommon.scaffoldBackGroundColor,
      body: Container(
        child: Column(
          children: [
            CustomTopSection(
              paddingBottom: 10,
              paddingTop: 10,
              paddingRight: 25,
              paddingLeft: 25,
              child: HeaderTextHelper(text: "Watchlist", fontSize: 32),
              childAlignment: MainAxisAlignment.start,
            ),
            const SizedBox(height: 1),
            WatchlistTabs(),
            SearchCreateBar(),
            Expanded(child: WatchlistsDashboardContent()),
          ],
        ),
      ),
    );
  }
}
