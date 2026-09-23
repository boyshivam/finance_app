import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/core/utils/helper_widgets/custom_top_section.dart";
import "package:aprreciate/core/utils/helper_widgets/header_text_helper.dart";
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

class _PortfolioDashboardScreenState
    extends ConsumerState<PortfolioDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsCommon.scaffoldBackGroundColor,
      body: Column(
        children: [
          CustomTopSection(
            paddingBottom: 10,
            paddingTop: 10,
            paddingRight: 25,
            paddingLeft: 25,
            child: HeaderTextHelper(text: "Portfolio", fontSize: 32),
            childAlignment: MainAxisAlignment.center
            ,
          ),
          PortfolioDashboardTabs(),
          PortfolioDashboard(),
          const SizedBox(height: 10),
          Expanded(child: PortfolioHoldingsViewer()),
        ],
      ),
    );
  }
}
