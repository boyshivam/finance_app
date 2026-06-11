
import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart';
import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_features/app_colors_home_dashboard.dart';
import 'package:aprreciate/features/home_dashboard/view/widgets/trading_signals/verdict_box.dart';
import 'package:aprreciate/models/home_dashboard/trading_signal_model.dart';
import "package:flutter/material.dart";

class TradingSignalsCard extends StatelessWidget {
  const TradingSignalsCard({super.key, required this.card});

  final TradingSignalModel card;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 25
      ),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColorsCommon.appWhite
      ),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Image.asset(card.stockIcon, width: 30, height: 30,),
                  const SizedBox(width: 10),
                  Text(card.stockSymbol, style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold
                  ),)
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                    Text('\$ ${card.currentPrice}', style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w700
                    )),
                    const SizedBox(height: 5,),
                  Text("Current price", style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w300
                  ),)
                ],
              )
            ],
          ),
          const Divider(color: AppColorsHomeDashboard.tradingSignalCardDivider),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("\$ ${card.entryPrice}", style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold
                  ) ),
                  const SizedBox(height: 5,),
                  Text("Entry price" , style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w300
                  ))
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("\$ ${card.exitPrice}", style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold
                  ) ),
                  const SizedBox(height: 5,),
                  Text("Exit price" , style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w300
                  ))
                ],
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Text("Gain ${card.gain} %", style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColorsCommon.positiveGreen,
                fontWeight: FontWeight.bold
              ),),
              const Spacer(),
              VerdictBox(text: card.verdict)
            ],
          ),
        ],
      ),
    );
  }
}
