import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/core/utils/helper_widgets/header_text_helper.dart"
    show HeaderTextHelper;
import "package:aprreciate/features/LRS_flow/view/widgets/us_wallet_dashboard/lrs_balance_section.dart";
import "package:aprreciate/features/cashfree_flow/view/widgets/cash_free_dashboard_widgets/cashFree_balance_section.dart";
import "package:aprreciate/features/cashfree_flow/view/widgets/cash_free_dashboard_widgets/cashfree_orders_section.dart";
import "package:aprreciate/features/cashfree_flow/view/widgets/cash_free_dashboard_widgets/proceed_CTA_cashfree.dart";
import "package:aprreciate/features/profile_dashboard/view/widgets/top_section.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class CashfreeDashboard extends StatelessWidget {
  const CashfreeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
              25,
              MediaQuery.of(context).padding.top + 5,
              25,
              30,
            ),
            decoration: BoxDecoration(
              color: AppColorsCommon.appreciateThemeColor,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: (){
                  context.pop();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColorsCommon.appWhite,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
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
