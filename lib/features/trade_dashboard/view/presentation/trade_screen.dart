import "package:aprreciate/core/constants/app_assets/app_assets_common.dart";
import "package:aprreciate/core/constants/app_strings/app_strings_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/trade_dashboard/view/widgets/fees_section/trade_fees_section.dart";
import "package:aprreciate/features/trade_dashboard/view/widgets/order_placement_section/order_placment_section.dart";
import "package:aprreciate/features/trade_dashboard/view/widgets/purchase_section/purchase_section.dart";
import "package:aprreciate/features/trade_dashboard/view/widgets/security_details/security_details.dart";
import "package:aprreciate/features/trade_dashboard/view/widgets/trade%20_top_section/trade_top_section.dart";
import "package:aprreciate/features/trade_dashboard/view_model/trade_screen_provider.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:flutter/material.dart";

class TradeScreen extends ConsumerStatefulWidget {
  const TradeScreen({super.key});

  @override
  ConsumerState<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends ConsumerState<TradeScreen> {
  // text editing controllers
  late TextEditingController amountController;
  late TextEditingController quantityController;

  // initialise controller
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountController = TextEditingController();
    quantityController = TextEditingController();
  }

  // dispose controllers
  @override
  void dispose() {
    super.dispose();
    amountController.dispose();
    quantityController.dispose();
  }

  // fetch the current text in amount controller
  get amountControllerText => amountController.text;

  // fetch the current text in quantity controller
  get quantityControllerText => quantityController.text;

  // check empty field
  void checkEmptyField() {
    ref
        .read(tradeScreenProvider.notifier)
        .checkIfFieldsEmpty(amountControllerText, quantityControllerText);
  }

  // reflect quantity for the entered amount
  void quantByAmount() {
    ref
        .read(tradeScreenProvider.notifier)
        .deriveQuantityByAmount(amountControllerText);
    quantityController.text = ref.watch(tradeScreenProvider);
  }

  // reflect amount for entered quant
  void amountByQuant() {
    amountController.text = ref
        .read(tradeScreenProvider.notifier)
        .deriveAmountByQuantity2(quantityControllerText);
  }

  // this is to show snack bar message on currency toggle
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

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(tradeScreenProvider);

    return Scaffold(
      backgroundColor: AppColorsCommon.scaffoldBackGroundColor,
      body: Column(
        children: [
          TradeTopSection(
            toggleCurrency: toggleCurrency,
            toggledUSD: toggledINR,
          ),
          SecurityDetails(),
          PurchaseSection(
            toggledINR: toggledINR,
            amountController: amountController,
            quantityController: quantityController,
            quantityPurchasedByAmount: deriveQuantityByAmount,
            amountEnteredByQuantity: deriveAmountByQuantity,
            isFieldEmpty: isFieldEmpty,
          ),
          TradeFeesSection(),
        ],
      ),
      bottomNavigationBar: OrderPlacementSection(
        inSufficientFunds: inSufficientFunds,
        checkIfFieldsEmpty: checkIfFieldsEmpty,
        checkOrderValidity: checkOrderValidity,
      ),
    );
  }
}
