import "package:aprreciate/features/stock_details_screen/view/widgets/security_details.dart";
import "package:aprreciate/features/stock_details_screen/view/widgets/stock_details_top_section.dart";
import "package:aprreciate/features/stock_details_screen/view/widgets/trade_buttons.dart";
import "package:flutter/material.dart";


class StockDetailsScreen extends StatefulWidget {
  const StockDetailsScreen({super.key});

  @override
  State<StockDetailsScreen> createState() => _StockDetailsScreenState();
}

class _StockDetailsScreenState extends State<StockDetailsScreen> {

   bool toggled = false;

  void currencyToggled(bool input) {
    setState(() {
      toggled = input;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StockDetailsTopSection(toggled: toggled,currencyToggled: currencyToggled ,),
          SecurityDetails()
        ],
      ),
      bottomNavigationBar: TradeButtonsSection(),
    );
  }
}
