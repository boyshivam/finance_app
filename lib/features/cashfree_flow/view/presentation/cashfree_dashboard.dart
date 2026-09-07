import "package:aprreciate/core/utils/helper_widgets/custom_top_section.dart";
import "package:aprreciate/core/utils/helper_widgets/header_text_helper.dart";
import "package:aprreciate/features/cashfree_flow/view/widgets/cash_free_dashboard_widgets/cashFree_balance_section.dart";
import "package:aprreciate/features/cashfree_flow/view/widgets/cash_free_dashboard_widgets/cashfree_orders_section.dart";
import "package:aprreciate/features/cashfree_flow/view/widgets/cash_free_dashboard_widgets/proceed_CTA_cashfree.dart";
import "package:flutter/material.dart";

class CashfreeDashboard extends StatelessWidget {
  const CashfreeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTopSection(
            childAlignment: MainAxisAlignment.center,
            child: HeaderTextHelper(text: "Bank Transactions"),
            showSupportIcon: true,
            showBackCTA: true,
          ),
          const SizedBox(height: 30),
          CashfreeBalanceSection(),
          const SizedBox(height: 30),
          CashFreeOrdersSection(),
          Spacer(),
          ProceedCtaCashfree(),
        ],
      ),
    );
  }
}
