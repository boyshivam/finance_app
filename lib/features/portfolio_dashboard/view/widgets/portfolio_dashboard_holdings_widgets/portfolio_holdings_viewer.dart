import "package:aprreciate/features/portfolio_dashboard/view/widgets/portfolio_dashboard_holdings_widgets/portfolio_holding_card.dart";
import "package:aprreciate/models/portfolio_holding_model/portfolio_holding_card_model.dart";
import "package:flutter/material.dart";

class PortfolioHoldingsViewer extends StatelessWidget {
  const PortfolioHoldingsViewer({super.key, required this.holdings});

  final List<PortfolioHoldingCardModel> holdings;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: holdings.length,
        itemBuilder: (context, index) =>
            PortfolioHoldingCard(holding: holdings[index]),
      ),
    );
  }
}
