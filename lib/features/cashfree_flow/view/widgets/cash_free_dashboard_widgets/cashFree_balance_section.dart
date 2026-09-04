import "package:aprreciate/features/cashfree_flow/view_model/providers/cashfree_screen_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class CashfreeBalanceSection extends ConsumerWidget {
  const CashfreeBalanceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final vmCashFreeProvider = ref.watch(cashFreeScreenProvider);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 25),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black45.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 3,
              offset: const Offset(3, 7),
            ),
          ],
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            colors: [
              Color(0xFFfaebc0),
              Color(0XFFf5aba2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Text("YES bank balance"),
            const SizedBox(height: 10),
            Text(
              "₹ ${vmCashFreeProvider.bankBalance.toStringAsFixed(2)} ",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
