import "package:aprreciate/core/constants/app_assets/app_assets.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/portfolio_dashboard/view/widgets/portfolio_dash_viewer_widgets/portfolio_dashboard_details.dart";
import "package:aprreciate/features/portfolio_dashboard/view/widgets/portfolio_dash_viewer_widgets/portfolio_dashviewer_freq_tabs.dart";
import "package:aprreciate/features/portfolio_dashboard/view_model/enums/net_change_frequency_tabs.dart";
import "package:aprreciate/features/portfolio_dashboard/view_model/provider/portfolio_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class PortfolioDashboard extends ConsumerWidget {
  const PortfolioDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmState = ref.watch(portfolioProvider);

    final totalPnLSelected =
        vmState.selectedNetChangeFrequencyTab ==
        NetChangeFrequencyTabs.totalPnL;

    return Padding(
      padding: const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 30),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppColorsCommon.lightGreen,
                border: Border.all(
                  color: AppColorsCommon.positiveGreen,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (totalPnLSelected
                            ? vmState.totalPnLChange
                            : vmState.dailyPnLChange)
                        .toStringAsFixed(2),
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: AppColorsCommon.positiveGreen,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Row(
                    children: [
                      Image.asset(
                        AppAssets.value_growth_icon,
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        (totalPnLSelected
                                ? vmState.totalPnLPercentageChange
                                : vmState.dailyPnLPercentageChange)
                            .toStringAsFixed(2),
                        style: Theme.of(context).textTheme.headlineLarge!
                            .copyWith(
                              color: AppColorsCommon.positiveGreen,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 0,
            right: 0,
            child: Center(child: PortfolioDashViewerFreqTabs()),
          ),
          Positioned(
            top: 180,
            left: 25,
            right: 25,
            child: PortfolioDashboardDetails(),
          ),
        ],
      ),
    );
  }
}
