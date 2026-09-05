import "package:aprreciate/core/utils/helper_widgets/header_text_helper.dart" show HeaderTextHelper;
import "package:aprreciate/features/LRS_flow/view/widgets/us_wallet_dashboard/lrs_balance_section.dart";
import "package:aprreciate/features/cashfree_flow/view/widgets/cash_free_dashboard_widgets/balance_sliver_delegate.dart";
import "package:aprreciate/features/cashfree_flow/view/widgets/cash_free_dashboard_widgets/cashFree_balance_section.dart";
import "package:aprreciate/features/cashfree_flow/view/widgets/cash_free_dashboard_widgets/cashfree_orders_section.dart";
import "package:aprreciate/features/cashfree_flow/view/widgets/cash_free_dashboard_widgets/cashfree_orders_viewer.dart";
import "package:aprreciate/features/cashfree_flow/view/widgets/cash_free_dashboard_widgets/proceed_CTA_cashfree.dart";
import "package:aprreciate/features/profile_dashboard/view/widgets/top_section.dart";
import "package:flutter/material.dart";


class CashfreeDashboard extends StatelessWidget {
  const CashfreeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Top spacing
          const SliverToBoxAdapter(
            child: SizedBox(height: 40,),
          ),

          // collapsing balance section
          SliverPersistentHeader(
            pinned: true,
            delegate: BalanceSliverDelegate(),
          ),

          // Spacing
          const SliverToBoxAdapter(
            child: SizedBox(height: 30,),
          ),

          // orders section header and empty state
          const SliverToBoxAdapter(
            child: CashFreeOrdersSection(),
          ),

          // orders listing
          const CashFreeOrdersViewer(),

          // proceed CTA
          const SliverToBoxAdapter(
            child: ProceedCtaCashfree() ,
          )


        ],
      )


    );
  }
}
