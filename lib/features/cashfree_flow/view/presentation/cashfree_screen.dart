import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart';
import 'package:aprreciate/features/cashfree_flow/view/widgets/cashfree_screen_widgets/cashfree_top_section.dart';
import 'package:aprreciate/features/cashfree_flow/view/widgets/cashfree_screen_widgets/transaction_details_section.dart';
import 'package:flutter/material.dart';

class CashFreeScreen extends StatelessWidget {
  const CashFreeScreen({super.key});

  // function to validate UPI ID --
  bool checkUpiValidity(String upiID) {
    final validBankIds = ["@sbi", "@hdfcbank", '@icici', '@axisbank', '@kotak'];
    
    final regex = RegExp(r'^[6-9]\d{9}(' + validBankIds.join('|') + r')$');

    return regex.hasMatch(upiID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
          child: Column(
            children: [
              CashFreeTopSection(),
              const SizedBox(height: 100,),
              TransactionDetailsSection(checkUpiValidity: checkUpiValidity),
              // const Spacer(),
              // ProceedPayCta(),
            ],
          ),
        ),
      ),
      backgroundColor: AppColorsCommon.scaffoldBackGroundColor,
    );
  }
}
