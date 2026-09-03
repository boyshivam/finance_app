import "package:aprreciate/core/utils/helper_widgets/header_text_helper.dart";
import "package:aprreciate/features/LRS_flow/view/widgets/us_wallet_dashboard/lrs_balance_section.dart";
import "package:aprreciate/features/LRS_flow/view/widgets/us_wallet_dashboard/proceed_to_lrs.dart";
import "package:aprreciate/features/LRS_flow/view/widgets/us_wallet_dashboard/us_wallet_orders_section.dart";
import "package:aprreciate/features/profile_dashboard/view/widgets/top_section.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class UsWalletDashboard extends ConsumerWidget {
  const UsWalletDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          TopSection(child: HeaderTextHelper(text: "US Wallet"),),
          const SizedBox(height: 40,),
          LrsBalanceSection(),
          const SizedBox(height: 30,),
          UsWalletOrdersSection(),
          Spacer(),
          ProceedToLrsCTA()
        ],
      ),
    );
  }
}
