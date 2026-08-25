import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart';
import 'package:aprreciate/features/cashfree_flow/view/widgets/cashfree_top_section.dart';
import 'package:aprreciate/features/cashfree_flow/view/widgets/proceed_pay_CTA.dart';
import 'package:aprreciate/features/cashfree_flow/view/widgets/transaction_details_section.dart';
import 'package:flutter/material.dart';

class CashFreeScreen extends StatelessWidget {
  const CashFreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CashFreeTopSection(),
            const SizedBox(height: 40,),
            TransactionDetailsSection(),
            ProceedPayCta(),
          ],
        ),
      ),
      backgroundColor: AppColorsCommon.scaffoldBackGroundColor,
    );
  }
}
