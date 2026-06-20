import 'package:aprreciate/core/constants/app_assets/assets_home_dashboard/bottom_nav_bar_icons/bottom_nav_bar_icons.dart';
import 'package:aprreciate/core/constants/app_strings/features/app_strings_homescreen/app_string_home_screen.dart';
import 'package:aprreciate/models/home_screen_models/bottom_nav_bar_icon_model.dart';

const List<BottomNavBarItemModel> bottomNavBarItems = [
  BottomNavBarItemModel(
    itemLabel: AppStringsHomeScreen.homeDashBoardLabel,
    itemActiveIcon: BottomNavBarIcons.homeActiveIcon,
    itemInactiveIcon: BottomNavBarIcons.homeInactiveIcon,
  ),
  BottomNavBarItemModel(
    itemLabel: AppStringsHomeScreen.portfolioDashBoardLabel,
    itemActiveIcon: BottomNavBarIcons.portfolioActiveIcon,
    itemInactiveIcon: BottomNavBarIcons.portfolioInactiveIcon,
  ),
  BottomNavBarItemModel(
    itemLabel: AppStringsHomeScreen.searchDashBoardLabel,
    itemActiveIcon: BottomNavBarIcons.searchActiveIcon,
    itemInactiveIcon: BottomNavBarIcons.searchInactiveIcon,
  ),
  BottomNavBarItemModel(
    itemLabel: AppStringsHomeScreen.watchDashBoardLabel,
    itemActiveIcon: BottomNavBarIcons.watchlistActiveIcon,
    itemInactiveIcon: BottomNavBarIcons.watchlistInactiveIcon,
  ),
  BottomNavBarItemModel(
    itemLabel: AppStringsHomeScreen.profileLabel,
    itemActiveIcon: BottomNavBarIcons.profileActiveIcon,
    itemInactiveIcon: BottomNavBarIcons.profileInactiveIcon,
  ),


];
