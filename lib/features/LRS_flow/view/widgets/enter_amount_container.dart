import "package:aprreciate/core/constants/app_strings/app_strings_common.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/LRS_flow/enums/order_validity_states.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_screen/lrs_provider.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class EnterAmountContainer extends ConsumerWidget {
  const EnterAmountContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(lrsProvider);
    final lrsNotifier = ref.read(lrsProvider.notifier);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: AppColorsCommon.appWhite,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Enter transfer amount",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 24,
                  color: AppColorsCommon.textGrey,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Amount text field
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                TextInputFormatter.withFunction((oldValue, newValue) {
                  final text = newValue.text;

                  if (RegExp(r'^\d*\.?\d{0,2}$').hasMatch(text)) {
                    return newValue;
                  }
                  return oldValue;
                }),
              ],
              style: const TextStyle(fontSize: 22),
              maxLength: 10,
              decoration: InputDecoration(
                counterText: "",
                prefix: Text(
                  " \$   ",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                contentPadding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 0,
                ),
                border: InputBorder.none,

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: AppColorsCommon.lightBlueBackground,
                    width: 2,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: AppColorsCommon.appreciateThemeColor,
                    width: 2,
                  ),
                ),
              ),
              onChanged: (amount) {
                lrsNotifier.deriveAmountEntered(amount);
                lrsNotifier.validateLrsOrder();
              },
            ),
            const SizedBox(height: 5),
            if (vm.orderValidityStates == OrderValidityStates.empty &&
                vm.submitClicked == true)
              Text(
                "Amount cannot be empty",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColorsCommon.appreciateThemeError,
                  fontSize: 18,
                ),
              ),
            if (vm.orderValidityStates == OrderValidityStates.invalid)
              Text(
                "Enter valid amount",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColorsCommon.appreciateThemeError,
                  fontSize: 18,
                ),
              ),
            if (vm.orderValidityStates == OrderValidityStates.inSufficient)
              Text(
                "Insufficient funds in bank account",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColorsCommon.appreciateThemeError,
                  fontSize: 18,
                ),
              ),
            const SizedBox(height: 20),
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.compare_arrows, size: 20),
                    const SizedBox(width: 5),
                    Text(
                      (vm.enteredAmountDouble * AppStringsCommon.currentFxRate)
                          .toStringAsFixed(2),
                    ),
                    const SizedBox(width: 3),
                    Text(
                      "(\$1 = ${vm.fxRate})",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColorsCommon.textGrey,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text("In INR"),
              ],
            ),
            const Divider(
              color: AppColorsCommon.inactiveTextFieldBorderColor,
              thickness: 3,
            ),
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.timelapse, size: 20),
                    const SizedBox(width: 5),
                    Text("Tomorrow"),
                    const SizedBox(width: 3),
                  ],
                ),
                const Spacer(),
                Text("Processing Date"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
