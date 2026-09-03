import "package:aprreciate/features/LRS_flow/view/widgets/us_wallet_dashboard/us_wallet_order_card.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_order/lrs_transaction_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class UsWalletOrdersViewer extends ConsumerWidget {
  const UsWalletOrdersViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Lrs Transaction provider
    final vmLrsTransactions = ref.watch(lrsTransactionProvider);

    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: vmLrsTransactions.length,
        itemBuilder: (context, index) =>
            UsWalletOrderCard(usWalletOrder: vmLrsTransactions[index]),
      ),
    );
  }
}
