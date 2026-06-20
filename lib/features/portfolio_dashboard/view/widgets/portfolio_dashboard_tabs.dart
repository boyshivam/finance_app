import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/data/portfolio_dashboard_data/portfolio_tabs_data.dart";
import "package:aprreciate/data/search_dashboard_data/search_tabs.dart";
import "package:aprreciate/features/portfolio_dashboard/view/widgets/PortfolioTabPill.dart";
import "package:flutter/material.dart";

class PortfolioDashboardTabs extends StatelessWidget {
  const PortfolioDashboardTabs({
    super.key,
    required this.onSelectTab,
    required this.selectedTabIndex,
    required this.scrollController,
  });

  final int selectedTabIndex;
  final void Function(int index) onSelectTab;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 12, 0, 12),
      height: 60,
      color: AppColorsCommon.appWhite,
      child: ListView.separated(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            onSelectTab(index);
          },
          child: PortfolioTabPill(
            tab: portfolioTabs[index],
            selectedIndex: selectedTabIndex == index,
          ),
        ),
        separatorBuilder: (_, _) => const SizedBox(width: 30),
        itemCount: portfolioTabs.length,
      ),
    );
  }
}
