import "package:aprreciate/core/constants/app_assets/home_dashboard/bottom_nav_bar_icons/bottom_nav_bar_icons.dart";
import "package:aprreciate/features/home_dashboard/view/screens/home_dashboard_screen.dart";
import "package:aprreciate/features/search_dashboard/view/presentation/search_dashboard.dart";
import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPageIndex = 0;

  final pages = [HomeDashboardScreen(), SearchDashboardScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: selectedPageIndex, children: pages),

      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedPageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(BottomNavBarIcons.homeActiveIcon),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(BottomNavBarIcons.searchInactiveIcon),
            label: "Search",
          ),
        ],
      ),
    );
  }
}
