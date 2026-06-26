import "package:aprreciate/core/constants/app_assets/app_assets_common.dart";
import "package:aprreciate/core/constants/app_strings/app_strings_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/trade_dashboard/widgets/fees_section/trade_fees_section.dart";
import "package:aprreciate/features/trade_dashboard/widgets/order_placement_section/order_placment_section.dart";
import "package:aprreciate/features/trade_dashboard/widgets/purchase_section/purchase_section.dart";
import "package:aprreciate/features/trade_dashboard/widgets/security_details/security_details.dart";
import "package:aprreciate/features/trade_dashboard/widgets/trade%20_top_section/trade_top_section.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:flutter/material.dart";

class TradeScreen extends StatefulWidget {
  const TradeScreen({super.key});

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  // currency toggled to INR
  bool toggledINR = false;

  // price of the tesla stock
  double stockTeslaPrice = 999;

  // quantity as per entered amount
  double quantityPurchasedByAmount = 0;

  // amount as per entered quantity
  double amountEnteredByQuantity = 0;

  // insufficient_US_wallet_balance
  bool inSufficientFunds = false;

  // current INR value
  double convertedValue = 0;

  // check for empty fields
  bool isFieldEmpty = false;

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




  // check if amount or quantity fields are empty
  bool checkIfFieldsEmpty() {
    if (amountController.text.trim().isEmpty ||
        quantityController.text.trim().isEmpty) {
      setState(() {
        isFieldEmpty = true;
      });
      return true;
    }
    setState(() {
      isFieldEmpty = false;
    });
    return false;
  }

  // units purchased as per amount entered
  void deriveQuantityByAmount() {
    // set the insufficient funds toggle to false whenever typing
    setState(() {
      inSufficientFunds = false;
    });

    if (amountController.text.trim().isEmpty) {
      quantityController.clear();
    }
    double amount = double.parse(amountController.text);
    quantityController.text = (amount / stockTeslaPrice).toStringAsFixed(2);
  }

  // derive quantity out of amount
  void deriveAmountByQuantity() {
    // set the insufficient funds toggle to false whenever typing
    setState(() {
      inSufficientFunds = false;
    });

    if (quantityController.text.trim().isEmpty) {
      amountController.clear();
    }
    double quantity = double.parse(quantityController.text);
    amountController.text = (quantity * stockTeslaPrice).toStringAsFixed(2);
  }

  // function to toggle currency and convert entered amount
  void toggleCurrency(bool change) {
    final enteredAmount = double.parse(amountController.text);

    if (change) {
      convertedValue =
          enteredAmount * double.parse(AppStringsCommon.currentFxRate);
    } else {
      convertedValue =
          enteredAmount / double.parse(AppStringsCommon.currentFxRate);
    }
    setState(() {
      toggledINR = change;
      amountController.text = convertedValue.toStringAsFixed(2);
      currencyToggleSnackBarMessage();
    });
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

  // check if order can be placed based on balance in US wallet and
  void checkOrderValidity() {
    double enteredAmount = double.parse(amountController.text);
    if (enteredAmount > double.parse(AppStringsCommon.USWalletBalance)) {
      setState(() {
        inSufficientFunds = true;
      });
    }
    if (enteredAmount <= double.parse(AppStringsCommon.stockTeslaPrice)) {
      AppNavigators.gotToOrderPlacedScreen(context);
      inSufficientFunds = false;
    }
  }

  @override
  Widget build(BuildContext context) {
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
            isFieldEmpty: isFieldEmpty
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
