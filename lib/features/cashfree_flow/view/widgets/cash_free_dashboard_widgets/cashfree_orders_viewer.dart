import "package:aprreciate/features/cashfree_flow/view/widgets/cash_free_dashboard_widgets/cashfree_order_card.dart";
import "package:aprreciate/features/cashfree_flow/view_model/providers/cashfree_orders_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class CashFreeOrdersViewer extends ConsumerWidget {
  const CashFreeOrdersViewer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Lrs Transaction provider
    final vmCashFreeOrders = ref.watch(cashFreeOrdersProvider);

    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: vmCashFreeOrders.length,
        itemBuilder: (context, index) => CashFreeOrderCard(cashFreeOrder: vmCashFreeOrders[index]),
      ),
    );
  }
}
