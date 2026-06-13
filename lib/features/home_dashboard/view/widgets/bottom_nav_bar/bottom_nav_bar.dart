import "package:aprreciate/core/constants/app_assets/home_dashboard/bottom_nav_bar_icons/bottom_nav_bar_icons.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.fromLTRB(
        10, 10, 10, 5
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColorsCommon.appWhite
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(BottomNavBarIcons.homeActiveIcon, width: 30, height: 30,),
              const SizedBox(height:5),
              Text("Home", style: Theme.of(context).textTheme.bodySmall,),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(BottomNavBarIcons.portfolioInactiveIcon, width: 30, height: 30),
              const SizedBox(height:5),
              Text("Portfolio", style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(BottomNavBarIcons.searchInactiveIcon, width: 30, height: 30),
              const SizedBox(height:5),
              Text("Search", style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(BottomNavBarIcons.watchlistInactiveIcon, width: 30, height: 30),
              const SizedBox(height:5),
              Text("Watchlist", style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(BottomNavBarIcons.profileInactiveIcon, width: 30, height: 30),
              const SizedBox(height:5),
              Text("Profile", style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}
