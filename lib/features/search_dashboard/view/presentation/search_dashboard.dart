import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:flutter/material.dart";

class SearchDashboardScreen extends StatefulWidget {
  const SearchDashboardScreen({super.key});

  @override
  State<SearchDashboardScreen> createState() => _SearchDashboardScreenState();
}

class _SearchDashboardScreenState extends State<SearchDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).padding.top + 16),
            child: Text("Search", style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 28
            ),),
            color: AppColorsCommon.appWhite,
          )
        ],
      ),
    );
  }
}

