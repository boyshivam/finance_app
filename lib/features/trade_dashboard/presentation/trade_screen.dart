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

  // insufficient_US_wallet_balance
  bool inSufficientFunds = false;

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

  void toggleCurrency(bool change) {
    setState(() {
      toggledINR = change;
    });
  }

  void checkOrderValidity() {
    double enteredAmount = double.parse(amountController.text);
    if(enteredAmount > double.parse(AppStringsCommon.USWalletBalance)){
      setState(() {
        inSufficientFunds = true;
      });
    }
    if (enteredAmount <= double.parse(AppStringsCommon.stockTeslaPrice)) {
      AppNavigators.gotToOrderPlacedScreen(context);
      inSufficientFunds = false;
    }else{
      print("insufficient balance");
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
            amountController: amountController,
            quantityController: quantityController,
          ),
          TradeFeesSection(),
        ],
      ),
      bottomNavigationBar: OrderPlacementSection(
        inSufficientFunds: inSufficientFunds,

        checkOrderValidity: checkOrderValidity,
      ),
    );
  }
}
