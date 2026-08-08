import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/stock_details_screen/enum/stock_details_toggle_state.dart";
import "package:aprreciate/features/stock_details_screen/view_model/provider/stock_details_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class StockDetailsCurrencyToggle extends ConsumerWidget {
  const StockDetailsCurrencyToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockDetailsState = ref.watch(stockDetailsProvider);

    return Container(
      width: 70,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.5,
          color: AppColorsCommon.appreciateThemeColor,
        ),
        borderRadius: BorderRadius.circular(20),
        color: AppColorsCommon.lightBlueBackground,
      ),
      child: GestureDetector(
        onTap: () {
          final notifier = ref.read(stockDetailsProvider.notifier);
          notifier.currencyToggle();
        },
        child: AnimatedAlign(
          curve: Curves.easeIn,
          alignment:
              stockDetailsState.currencyToggleState ==
                  StockDetailsToggleState.usd
              ? Alignment.centerLeft
              : Alignment.centerRight,
          duration: Duration(milliseconds: 100),
          child: Container(
            height: 38.5,
            width: 33.5,
            decoration: BoxDecoration(
              color: AppColorsCommon.appWhite,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child:
                  stockDetailsState.currencyToggleState ==
                      StockDetailsToggleState.usd
                  ? Text(
                      "\$",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColorsCommon.appreciateThemeColor,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : Text(
                      "₹",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColorsCommon.appreciateThemeColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
