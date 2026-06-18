import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/data/home_screen/home_screen_data.dart";
import "package:aprreciate/features/home_screen/bottom_nav_bar/bottom_nav_item.dart";
import "package:flutter/material.dart";

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColorsCommon.appWhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: bottomNavBarItems.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;

          return InkWell(
            onTap: () {
              onTap(index);
            },
            child: BottomNavItem(
              labelText: item.itemLabel,
              iconText: selectedIndex == index
                  ? item.itemActiveIcon
                  : item.itemInactiveIcon,
            ),
          );
        }).toList(),
      ),
    );
  }
}
