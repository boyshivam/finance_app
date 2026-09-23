import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_screen/lrs_provider.dart";
import "package:aprreciate/features/portfolio_dashboard/view_model/provider/portfolio_holdings_provider.dart";
import "package:aprreciate/features/profile_dashboard/enums/trade_order_type_enums.dart";
import "package:aprreciate/features/trade_dashboard/enums/us_wallet_funds_state.dart";
import "package:aprreciate/features/trade_dashboard/view/widgets/order_placement_section/order_slider.dart";
import "package:aprreciate/features/trade_dashboard/view_model/trade_screen_view_model/trade_screen_provider.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OrderPlacementSection extends ConsumerWidget {
  const OrderPlacementSection({
    super.key,
    required this.tradeOrderType,
    required this.securitySymbol,
  });

  final String securitySymbol;

  final TradeOrderTypeEnums tradeOrderType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // trade provider
    final vmState = ref.watch(tradeScreenProvider);

    // LRS provider to access its state parameters
    final vmLRS = ref.watch(lrsProvider);

    // portfolio holdings provider
    final vmPortfolioHoldingsNotifier = ref.read(
      portfolioHoldingsProvider.notifier,
    );

    return Container(
      padding: EdgeInsets.fromLTRB(25, 20, 25, 40),
      decoration: BoxDecoration(
        color: AppColorsCommon.appWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [



          // this is handling the error message in case of insufficient us wallet balance or holdin
          Row(
            children: [
              if (tradeOrderType == TradeOrderTypeEnums.buyFraction &&
                  vmState.usWalletFundsState ==
                      UsWalletFundsState.insufficientFunds)
                Text(
                  "Insufficient Funds in wallet",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColorsCommon.negativeRed,
                  ),
                ),
              if (tradeOrderType == TradeOrderTypeEnums.sellFraction &&
                  vmState.usWalletFundsState ==
                      UsWalletFundsState.insufficientFunds)
                Text(
                  "Insufficient Funds in wallet",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColorsCommon.negativeRed,
                  ),
                ),
              // if (tradeOrderType == TradeOrderTypeEnums.sellFraction &&
              //     vmState.usWalletFundsState ==
              //         UsWalletFundsState.insufficientFunds)
              //   Expanded(
              //     child: Text(
              //       "Amount entered is greater than holdings",
              //       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              //         color: AppColorsCommon.negativeRed,
              //       ),
              //     ),
              //   ),

            ],
          ),



          // this will show the us wallet balance for buy and sell, and holdings for sell
          Row(
            children: [
              Text(
                "US Wallet balance:",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Text("\$${vmLRS.usWalletBalance.toStringAsFixed(2)}"),
                  const SizedBox(width: 5),
                  Icon(Icons.arrow_drop_down_circle_outlined),
                ],
              ),
            ],
          ),
          if(tradeOrderType == TradeOrderTypeEnums.sellFraction)
          Row(
            children: [
              Text(
                "Amount in holding:",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Text("\$${vmPortfolioHoldingsNotifier.fetchHoldingAmount(securitySymbol).toStringAsFixed(2)}"),
                  const SizedBox(width: 5),
                  Icon(Icons.arrow_drop_down_circle_outlined),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),



          // incase of buy orders, order placement slider or add funds CTA will be shown
          if (tradeOrderType == TradeOrderTypeEnums.buyFraction)
            if (vmState.usWalletFundsState ==
                UsWalletFundsState.insufficientFunds)
              SizedBox(
                height: 50,
                child: InkWell(
                  onTap: () {
                    AppNavigators.gotoLrsScreen(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColorsCommon.appreciateThemeColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Add funds to US wallet",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColorsCommon.appWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            else
              OrderSlider(
                tradeOrderType: tradeOrderType,
                securitySymbol: securitySymbol,
              ),


          // incase of sell orders, order placement slider or add funds CTA will be shown
          if (tradeOrderType == TradeOrderTypeEnums.sellFraction)
            // if (vmState.usWalletFundsState ==
            //     UsWalletFundsState.insufficientFunds)
            //   SizedBox(
            //     height: 50,
            //     child: InkWell(
            //       onTap: () {
            //         AppNavigators.gotoLrsScreen(context);
            //       },
            //       child: Container(
            //         padding: EdgeInsets.symmetric(vertical: 10),
            //         width: double.infinity,
            //         decoration: BoxDecoration(
            //           color: AppColorsCommon.appreciateThemeColor,
            //           borderRadius: BorderRadius.circular(16),
            //         ),
            //         child: Align(
            //           alignment: Alignment.center,
            //           child: Text(
            //             "Add funds to US wallet",
            //             style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            //               color: AppColorsCommon.appWhite,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   )
            // else
              OrderSlider(
                tradeOrderType: tradeOrderType,
                securitySymbol: securitySymbol,
              ),



        ],
      ),
    );
  }
}
