import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/models/portfolio_holding_model/portfolio_holding_card_model.dart";
import "package:flutter/material.dart";

class PortfolioHoldingCard extends StatelessWidget {
  const PortfolioHoldingCard({super.key, required this.holding});

  final PortfolioHoldingCardModel holding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColorsCommon.appreciateThemeColor),
        color: AppColorsCommon.appWhite,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(holding.securityIcon, width: 40, height: 40),
              const SizedBox(width: 10),
              Column(
                children: [
                  Text(holding.securityName, style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 24
                  ),),
                  Text(
                    "${holding.securityPrice}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
          const Divider(
            color: AppColorsCommon.inactiveTextFieldBorderColor,
            thickness: 2,
          ),
          Row(
            children: [
              Column(
                children: [
                  Text("Invested"),
                  const SizedBox(height: 10),
                  Text("${holding.investedAmount}"),
                  const SizedBox(height: 20),
                  Text("Avg: ${holding.average}"),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text("Total P&L"),
                  const SizedBox(height: 10),
                  Text("8938323"),
                  const SizedBox(height: 20),
                  Text("Qty: ${holding.purchasedQuantity}"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
