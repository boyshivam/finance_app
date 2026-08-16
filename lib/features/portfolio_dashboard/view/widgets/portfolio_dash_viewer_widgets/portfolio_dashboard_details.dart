import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/portfolio_dashboard/view_model/provider/portfolio_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class PortfolioDashboardDetails extends ConsumerWidget {
  const PortfolioDashboardDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmState = ref.watch(portfolioProvider);

    return Container(
      padding: EdgeInsets.all(20),
      height: 110,
      decoration: BoxDecoration(
        color: AppColorsCommon.appWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Invested"),
              const SizedBox(height: 5),
              Text(
                vmState.investedAmount.toStringAsFixed(2),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Current"),
              const SizedBox(height: 5),
              Text(
                vmState.currentAmount.toStringAsFixed(2),
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
