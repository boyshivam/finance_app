import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart';
import 'package:aprreciate/features/cashfree_flow/view/widgets/cashfree_screen_widgets/cashfree_top_section.dart';
import 'package:aprreciate/features/cashfree_flow/view/widgets/cashfree_screen_widgets/proceed_pay_CTA.dart';
import 'package:aprreciate/features/cashfree_flow/view/widgets/cashfree_screen_widgets/transaction_details_section.dart';
import 'package:flutter/material.dart';

class CashFreeScreen extends StatelessWidget {
  const CashFreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
        child: Column(
          children: [
            CashFreeTopSection(),
            const Spacer(),
            TransactionDetailsSection(),
            const Spacer(),
            ProceedPayCta()

          ],
        ),
      ),
      backgroundColor: AppColorsCommon.scaffoldBackGroundColor,
    );
  }
}
