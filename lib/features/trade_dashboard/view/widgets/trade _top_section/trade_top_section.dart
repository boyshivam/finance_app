import "package:aprreciate/core/constants/app_assets/app_assets_common.dart";
import "package:aprreciate/features/trade_dashboard/view/widgets/trade%20_top_section/trade_currency_toggle.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class TradeTopSection extends StatelessWidget {
  const TradeTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 70, 25, 10),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              context.pop();
            },
            child: Image.asset(
              AppAssetsCommon.generic_back_cta,
              height: 30,
              width: 30,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Image.asset(
                AppAssetsCommon.liveMarketIcon,
                width: 30,
                height: 20,
              ),
              const SizedBox(width: 5),
              Text("Live Market"),
            ],
          ),
          const Spacer(),
          CurrencyToggle(),
        ],
      ),
    );
  }
}
