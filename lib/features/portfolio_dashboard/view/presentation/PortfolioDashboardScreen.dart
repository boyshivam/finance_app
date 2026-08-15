import "package:aprreciate/features/portfolio_dashboard/view/widgets/portfolio_dashboard_holdings_widgets/portfolio_holdings_viewer.dart";
import "package:aprreciate/features/portfolio_dashboard/view/widgets/portfolio_dashboard_tabs.dart";
import "package:aprreciate/features/portfolio_dashboard/view/widgets/portfolio_dash_viewer_widgets/portfolio_status_viewer.dart";
import "package:aprreciate/features/portfolio_dashboard/view/widgets/portfolio_topsection.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class PortfolioDashboardScreen extends ConsumerStatefulWidget {
  const PortfolioDashboardScreen({super.key});

  @override
  ConsumerState<PortfolioDashboardScreen> createState() =>
      _PortfolioDashboardScreenState();
}

class _PortfolioDashboardScreenState extends ConsumerState<PortfolioDashboardScreen> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PortfolioDashTopSection(),
        PortfolioDashboardTabs(
        ),
        PortfolioDashboard(),
        Expanded(child: PortfolioHoldingsViewer())
      ],
    );
  }
}
