import "package:aprreciate/core/constants/app_assets/app_assets_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/watchlist_dashboard/view/widgets/watchlist_search_and%20_add_widgets/search_results_viewer.dart";
import "package:aprreciate/features/watchlist_dashboard/view_model/watchlist_provider.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

class SearchSecurityScreen extends ConsumerWidget {
  const SearchSecurityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                          final watchlistNotifier = ref.read(watchlistProvider.notifier);
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
            Expanded(child: SearchResultsViewer())
          ],
        ),
      ),
      backgroundColor: AppColorsCommon.scaffoldBackGroundColor,
    );
  }
}
