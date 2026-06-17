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
      body: Center(
        child: Text("Hello"),
      ),
    );
  }
}

