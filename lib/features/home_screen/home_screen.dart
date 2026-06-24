import "package:aprreciate/features/home_dashboard/view/screens/home_dashboard_screen.dart";
import "package:aprreciate/features/home_screen/bottom_nav_bar/bottom_nav_bar.dart";
import "package:aprreciate/features/portfolio_dashboard/view/presentation/PortfolioDashboardScreen.dart";
import "package:aprreciate/features/profile_dashboard/view/presentation/profile_screen.dart";
import "package:aprreciate/features/search_dashboard/view/presentation/search_dashboard.dart";
import "package:aprreciate/features/watchlist_dashboard/view/presentation/watchlist_dashboard.dart";
import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPageIndex = 0;

  final pages = [
    HomeDashboardScreen(),
    PortfolioDashboardScreen(),
    SearchDashboardScreen(),
    WatchlistDashboard(),
    ProfileScreen(),
  ];

  // function to switch between bottom nav icons
  void onTap(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPageIndex],

      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedPageIndex,
        onTap: onTap,
      ),
    );
  }
}
