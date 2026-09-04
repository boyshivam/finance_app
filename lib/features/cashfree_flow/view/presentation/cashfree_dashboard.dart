import "package:aprreciate/core/utils/helper_widgets/header_text_helper.dart" show HeaderTextHelper;
import "package:aprreciate/features/LRS_flow/view/widgets/us_wallet_dashboard/lrs_balance_section.dart";
import "package:aprreciate/features/cashfree_flow/view/widgets/cash_free_dashboard_widgets/cashFree_balance_section.dart";
import "package:aprreciate/features/cashfree_flow/view/widgets/cash_free_dashboard_widgets/cashfree_orders_section.dart";
import "package:aprreciate/features/cashfree_flow/view/widgets/cash_free_dashboard_widgets/proceed_CTA_cashfree.dart";
import "package:aprreciate/features/profile_dashboard/view/widgets/top_section.dart";
import "package:flutter/material.dart";


class CashfreeDashboard extends StatelessWidget {
  const CashfreeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopSection(child: HeaderTextHelper(text: "YES bank Dashboard"),),
          const SizedBox(height: 40,),
          CashfreeBalanceSection(),
          const SizedBox(height: 30,),
          CashFreeOrdersSection(),
          Spacer(),
          ProceedCtaCashfree()
        ],
      ),
    );
  }
}
