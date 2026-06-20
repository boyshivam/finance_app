import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";

class SearchTabPill extends StatelessWidget {
  const SearchTabPill({
    super.key,
    required this.tab,
    required this.selectedIndex,
  });

  final String tab;
  final bool selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: selectedIndex
            ? AppColorsCommon.appreciateThemeColor
            : AppColorsCommon.appWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(tab, style: Theme.of(context).textTheme.bodySmall!.copyWith(
        color: selectedIndex ? AppColorsCommon.appWhite : AppColorsCommon.textGrey,
        fontWeight: selectedIndex ? FontWeight.bold : FontWeight.w300,
        fontSize: 17
      ),),
    );
  }
}
