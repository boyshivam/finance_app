import "package:aprreciate/core/constants/app_assets/app_assets_common.dart";
import "package:aprreciate/core/constants/app_strings/app_strings_common.dart";
import "package:aprreciate/features/stock_details_screen/enum/stock_details_toggle_state.dart";
import "package:aprreciate/features/stock_details_screen/view/widgets/security_details.dart";
import "package:aprreciate/features/stock_details_screen/view/widgets/stock_details_top_section.dart";
import "package:aprreciate/features/stock_details_screen/view/widgets/trade_buttons.dart";
import "package:aprreciate/features/stock_details_screen/view_model/provider/stock_details_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class StockDetailsScreen extends ConsumerWidget {
  const StockDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void currencyToggleSnackBarMessage() {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Image.asset(AppAssetsCommon.snackBarTick, width: 25, height: 25),
              const SizedBox(width: 10),
              Text(
                "Currency exchange rate: \$1 = ₹${AppStringsCommon.currentFxRate}",
              ),
            ],
          ),
          duration: Duration(seconds: 2),
        ),
      );
    }

    ref.listen<StockDetailsToggleState>(
      stockDetailsProvider.select((state) => state.currencyToggleState),
      (previous, next) {
        if (previous != null && previous != next) {
          currencyToggleSnackBarMessage();
        }
      },
    );

    return Scaffold(
      body: Column(children: [StockDetailsTopSection(), SecurityDetails()]),
      bottomNavigationBar: TradeButtonsSection(),
    );
  }
}
