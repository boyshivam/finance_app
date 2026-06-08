import "package:aprreciate/features/home_dashboard/view/widgets/greeting/greetUser_section.dart";
import "package:aprreciate/features/home_dashboard/view/widgets/market_indices/market_indices_ticker.dart";
import "package:aprreciate/features/home_dashboard/view/widgets/our_offerings/our_offerings.dart";
import "package:flutter/material.dart";

class HomeDashboardScreen extends StatefulWidget {
  const HomeDashboardScreen({super.key});

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GreetUserSection(),
            MarketIndicesTicker(),
            OurOfferings()
            // market indices
            // Our offerings section
            //Trading signals
            // Continue where your left
            // Buy top US stocks
            // Invest in TOP mutual funds
            // Invest in TOP ETFs
            //
          ],
        ),
      )
    );
  }
}
