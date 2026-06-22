import "package:aprreciate/features/portfolio_dashboard/view/widgets/portfolio_dashboard_tabs.dart";
import "package:aprreciate/features/portfolio_dashboard/view/widgets/portfolio_dash_viewer_widgets/portfolio_status_viewer.dart";
import "package:aprreciate/features/portfolio_dashboard/view/widgets/portfolio_topsection.dart";
import "package:flutter/material.dart";

class PortfolioDashboardScreen extends StatefulWidget {
  const PortfolioDashboardScreen({super.key});

  @override
  State<PortfolioDashboardScreen> createState() =>
      _PortfolioDashboardScreenState();
}

class _PortfolioDashboardScreenState extends State<PortfolioDashboardScreen> {

  int selectedTabIndex = 0;
  late ScrollController tabScrollController;


  void onSelectTab(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabScrollController = ScrollController();
  }

  @override
  void dispose() {
    tabScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PortfolioDashTopSection(),
        PortfolioDashboardTabs(
          onSelectTab: onSelectTab,
          selectedTabIndex: selectedTabIndex,
          scrollController: tabScrollController,
        ),
        PortfolioStatusViewer()
      ],
    );
  }
}
