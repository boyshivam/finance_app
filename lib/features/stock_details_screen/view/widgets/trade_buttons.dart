import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/trade_dashboard/enums/trade_type_enum.dart";
import "package:aprreciate/features/trade_dashboard/helper/trade_screen_args.dart";
import "package:aprreciate/features/trade_dashboard/view_model/trade_screen_provider.dart";
import "package:aprreciate/models/stocks_model/stock_card_model.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class TradeButtonsSection extends ConsumerWidget {
  const TradeButtonsSection({super.key, required this.security});

  final StockCardModel security;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.25),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              final notifier = ref.read(tradeScreenProvider.notifier);
              notifier.getSecurityDetails(
                security.stockName,
                security.stockSymbol,
                security.stockIcon,
              );
              context.push(
                AppRoutes.tradeScreen,
                extra: TradeScreenArgs(
                  selectedSecurity: security,
                  tradeType: TradeTypeEnum.sellFraction,
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
              decoration: BoxDecoration(
                color: AppColorsCommon.appWhite,
                border: Border.all(
                  width: 1,
                  color: AppColorsCommon.appreciateThemeColor,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                "Sell",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColorsCommon.appreciateThemeColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              final notifier = ref.read(tradeScreenProvider.notifier);
              notifier.getSecurityDetails(
                security.stockName,
                security.stockSymbol,
                security.stockIcon,
              );
              context.push(
                AppRoutes.tradeScreen,
                extra: TradeScreenArgs(
                  selectedSecurity: security,
                  tradeType: TradeTypeEnum.buyFraction,
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColorsCommon.appreciateThemeColor,
              ),
              child: Text(
                "Buy",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColorsCommon.appWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
