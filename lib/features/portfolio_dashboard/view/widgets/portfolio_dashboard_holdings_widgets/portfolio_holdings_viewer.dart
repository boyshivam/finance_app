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
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Column(
        children: [
          Text(
            "Holdings",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 22),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: holdingsData.length,
              itemBuilder: (context, index) =>
                  PortfolioHoldingCard(holding: holdingsData[index]),
            ),
          ),
        ],
      ),
    );
  }
}
