import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/data/search_dashboard_data/search_tabs.dart";
import "package:aprreciate/features/search_dashboard/view/widgets/search_tab_pill.dart";
import "package:flutter/material.dart";

class SearchTabs extends StatelessWidget {
  const SearchTabs({
    super.key,
    required this.onSelectTab,
    required this.selectedTabIndex,
    required this.scrollController
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
          onTap: (){onSelectTab(index);},
          child: SearchTabPill(tab: searchTabs[index], selectedIndex: selectedTabIndex == index),
        ),
        separatorBuilder: (_, _) => const SizedBox(width: 30),
        itemCount: searchTabs.length,
      ),
    );
  }
}
