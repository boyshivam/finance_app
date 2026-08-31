import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/portfolio_dashboard/view_model/enums/portfolio_tabs.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class PortfolioTabPill extends ConsumerWidget {
  const PortfolioTabPill({
    super.key,
    required this.tab,
    required this.selectedIndex,
  });

  final PortfolioTabsEnums tab;
  final bool selectedIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 20,
      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
      decoration: BoxDecoration(
        color: selectedIndex
            ? AppColorsCommon.appreciateThemeColor
            : AppColorsCommon.appWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        tab.name,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: selectedIndex
              ? AppColorsCommon.appWhite
              : AppColorsCommon.textGrey,
          fontWeight: selectedIndex ? FontWeight.bold : FontWeight.w300,
          fontSize: 17,
        ),
      ),
    );
  }
}
