import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/portfolio_dashboard/view/widgets/portfolio_dashboard_holdings_widgets/portfolio_holding_card.dart";
import "package:aprreciate/features/portfolio_dashboard/view_model/provider/portfolio_holdings_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class PortfolioHoldingsViewer extends ConsumerWidget {
  const PortfolioHoldingsViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final holdingsData = ref.watch(portfolioHoldingsProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Column(
        children: [
          if (holdingsData.isNotEmpty) ...[
            Text(
              "Holdings",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: holdingsData.length,
                itemBuilder: (context, index) =>
                    PortfolioHoldingCard(holding: holdingsData[index]),
              ),
            ),
          ],
          if (holdingsData.isEmpty) ...[
            const SizedBox(height: 70,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppColorsCommon.appWhite,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.folder,
                    size: 60,
                    color: AppColorsCommon.appreciateThemeColor,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "No holdings!",
                          style: Theme.of(context).textTheme.headlineLarge!
                              .copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                              ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Make an investment and see it here",
                          style: Theme.of(context).textTheme.headlineLarge!
                              .copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
