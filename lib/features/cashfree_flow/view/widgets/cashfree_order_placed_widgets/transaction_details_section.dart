import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/cashfree_flow/view_model/providers/cashfree_screen_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class TransactionDetailsSection extends ConsumerWidget {
  const TransactionDetailsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmCashFreeProvider = ref.watch(cashFreeScreenProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColorsCommon.appWhite,
          borderRadius: BorderRadius.circular(18),

          border: Border.all(
            color: AppColorsCommon.appreciateThemeColor,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Amount",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Text(vmCashFreeProvider.enteredAmount),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "UPI ID",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Text(vmCashFreeProvider.upiID),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Transaction ID",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Text(vmCashFreeProvider.upiID),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
