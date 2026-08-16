import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/portfolio_dashboard/view_model/enums/net_change_frequency_tabs.dart";
import "package:aprreciate/features/portfolio_dashboard/view_model/provider/portfolio_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class PortfolioDashViewerFreqTabs extends ConsumerWidget {
  const PortfolioDashViewerFreqTabs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmState = ref.watch(portfolioProvider);
    final notifier = ref.read(portfolioProvider.notifier);

    final totalSelected =
        vmState.selectedNetChangeFrequencyTab ==
        NetChangeFrequencyTabs.totalPnL;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      width: 200,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: AppColorsCommon.appWhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              notifier.selectChangeFrequencyTab(
                NetChangeFrequencyTabs.totalPnL,
              );
            },
            child: Text(
              'Total P&L',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: totalSelected
                    ? AppColorsCommon.appreciateThemeColor
                    : AppColorsCommon.textGrey,
                fontWeight: totalSelected ? FontWeight.w700 : FontWeight.w300,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Icon(Icons.circle, size: 7, color: AppColorsCommon.textGrey),
          const SizedBox(width: 5),
          InkWell(
            onTap: () {
              notifier.selectChangeFrequencyTab(
                NetChangeFrequencyTabs.dailyPnL,
              );
            },
            child: Text(
              "Day's P&L",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: totalSelected
                    ? Colors.black
                    : AppColorsCommon.appreciateThemeColor,
                fontWeight: totalSelected ? FontWeight.w300 : FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
