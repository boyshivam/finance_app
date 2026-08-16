import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/data/portfolio_dashboard_data/portfolio_tabs_data.dart";
import "package:aprreciate/features/portfolio_dashboard/view/widgets/PortfolioTabPill.dart";
import "package:aprreciate/features/portfolio_dashboard/view_model/provider/portfolio_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class PortfolioDashboardTabs extends ConsumerWidget {
  const PortfolioDashboardTabs({super.key,});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // current selected tab of the tabs
    final selectedTab = ref.watch(
      portfolioProvider.select((state) => state.selectedProductTab),
    );

    return Container(
      height: 60,
      padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
      color: AppColorsCommon.appWhite,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tab = portfolioTabs[index];

          return InkWell(
            onTap: () {
              final portfolioNotifier = ref.read(portfolioProvider.notifier);
              portfolioNotifier.selectPortfolioTab(tab);
            },
            child: PortfolioTabPill(
              tab: portfolioTabs[index],
              selectedIndex: selectedTab == tab,
            ),
          );
        },
        separatorBuilder: (_, _) => const SizedBox(width: 30),
        itemCount: portfolioTabs.length,
      ),
    );
  }
}
