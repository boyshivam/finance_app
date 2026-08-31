import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/LRS_flow/view/widgets/lrs_dashboard/lrs_balance_section.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_screen/lrs_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class UsWalletDashboard extends ConsumerWidget {
  const UsWalletDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmLrs = ref.watch(lrsProvider);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
            children: [
              LrsBalanceSection(),
              UsWalletOrder()]),
      ),
    );
  }
}
