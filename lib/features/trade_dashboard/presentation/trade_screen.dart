import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/trade_dashboard/widgets/fees_section/trade_fees_section.dart";
import "package:aprreciate/features/trade_dashboard/widgets/purchase_section/purchase_section.dart";
import "package:aprreciate/features/trade_dashboard/widgets/security_details/security_details.dart";
import "package:aprreciate/features/trade_dashboard/widgets/trade%20_top_section/trade_top_section.dart";
import "package:flutter/material.dart";

class TradeScreen extends StatefulWidget {
  const TradeScreen({super.key});

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {

  bool toggledUSD = false;

  void toggleCurrency(bool change ) {
    setState(() {
      toggledUSD = change;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorsCommon.scaffoldBackGroundColor,
      body: Column(
        children: [
          TradeTopSection(toggleCurrency: toggleCurrency,toggledUSD: toggledUSD,),
          SecurityDetails(),
          PurchaseSection(),
          TradeFeesSection()
        ],
      ),
    );
  }
}
