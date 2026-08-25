import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/cashfree_flow/view_model/providers/cashfree_provider.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class TransactionDetailsSection extends ConsumerWidget {
  const TransactionDetailsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(cashFreeProvider.notifier);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: AppColorsCommon.appWhite,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 2.5, color: AppColorsCommon.textGrey),
        ),
        child: Column(
          children: [
            Text("Enter amount to transfer"),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1.5, color: AppColorsCommon.textGrey),
              ),
              child: TextField(
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  TextInputFormatter.withFunction((oldValue, newValue) {
                    if (RegExp(r'^\d*\.?\d{0,2}$').hasMatch(newValue.text)) {
                      return newValue;
                    }
                    return oldValue;
                  }),
                ],
                decoration: InputDecoration(
                  prefix: Text(
                    "₹  ",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (amount) {
                  notifier.retrieveEnteredAmount(amount);
                },
              ),
            ),
            const SizedBox(height: 30),
            Text("Enter UPI ID or Phone number"),
            const SizedBox(height: 15),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1.5, color: AppColorsCommon.textGrey),
              ),
              child: TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9._@-]')),
                ],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (upiID) {
                  notifier.retrieveEnteredUpiID(upiID);
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
