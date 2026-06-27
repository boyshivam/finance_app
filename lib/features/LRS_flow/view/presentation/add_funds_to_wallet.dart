import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/LRS_flow/view/widgets/bottom_section_LRS.dart";
import "package:aprreciate/features/LRS_flow/view/widgets/enter_amount_container.dart";
import "package:aprreciate/features/LRS_flow/view/widgets/top_section_LRS.dart";
import "package:flutter/material.dart";

class AddFundsToWallet extends StatefulWidget {
  const AddFundsToWallet({super.key});

  @override
  State<AddFundsToWallet> createState() => _AddFundsToWalletState();
}

class _AddFundsToWalletState extends State<AddFundsToWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        TopSectionLrs(),
        EnterAmountContainer(),
      ]),
      backgroundColor: AppColorsCommon.scaffoldBackGroundColor,
      bottomNavigationBar: BottomSectionLrs(),
    );
  }
}
