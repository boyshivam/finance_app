import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/cashfree_flow/view/widgets/cash_free_dashboard_widgets/cashfree_orders_viewer.dart";
import "package:aprreciate/features/cashfree_flow/view_model/providers/cashfree_orders_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class CashFreeOrdersSection extends ConsumerWidget {
  const CashFreeOrdersSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmCashFreeTransactions = ref.watch(cashFreeOrdersProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Transaction History",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w900,
                  fontSize: 28,
                ),
              ),
              const Spacer(),
              Text("Filter"),
              Icon(Icons.filter_alt_outlined)
            ],
          ),
          const SizedBox(height: 30,),
          if (vmCashFreeTransactions.isEmpty)
            Container(
              padding: EdgeInsets.symmetric(vertical: 45, horizontal: 55),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppColorsCommon.appWhite,
              ),
              child: Column(
                children: [
                  Text(
                    "No transactions",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Bank related transactions will be visible here.",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w200,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          if (vmCashFreeTransactions.isNotEmpty)
            CashFreeOrdersViewer(),
        ],
      ),
    );
  }
}
