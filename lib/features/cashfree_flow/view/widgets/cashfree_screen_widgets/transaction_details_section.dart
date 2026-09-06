import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/core/utils/helper_widgets/custom_navigation_button_helper.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

class TransactionDetailsSection extends ConsumerWidget {
  const TransactionDetailsSection({super.key, required this.checkUpiValidity});

  final bool Function(String) checkUpiValidity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final vmNotifier = ref.read(cashFreeScreenProvider.notifier);
    // final vm = ref.watch(cashFreeScreenProvider);
    final formKey = GlobalKey<FormState>();

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            decoration: BoxDecoration(
              color: AppColorsCommon.appWhite,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 2.5, color: AppColorsCommon.textGrey),
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text field for amount
                  Text(
                    "Enter amount to transfer",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColorsCommon.appreciateThemeColor,
                        width: 2,
                      ),
                      color: AppColorsCommon.lightPurpleGradient,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(7),
                      ],
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        prefix: Text(
                          "₹ ",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Amount cannot be empty";
                        } else if (double.parse(value) < 10) {
                          return "Minimum transfer amount is ₹10";
                        } else if (value.length >= 10) {
                          return "Transaction up to 10 Lakhs allowed";
                        }
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                  ),

                  // text field for amount -
                  const SizedBox(height: 25),
                  const Divider(thickness: 2),
                  const SizedBox(height: 25),
                  Text(
                    "Enter UPI ID",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Text field for amount
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColorsCommon.appreciateThemeColor,
                        width: 2,
                      ),
                      color: AppColorsCommon.lightPurpleGradient,
                    ),
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'[a-zA-Z0-9@]'),
                        ),
                      ],
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                      ),
                      validator: (value) {
                        if (value == null) {
                          return "UPI ID cannot be empty";
                        }

                        final isValid = checkUpiValidity(value);
                        if (!isValid) {
                          return 'Invalid UPI ID';
                        }

                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          const SizedBox(height: 250),
          InkWell(
            onTap: () {
              if (formKey.currentState!.validate()) {
                context.push(AppRoutes.cashFreeTransactionPlaced);
              }
            },
            child: CustomNavigationButtonHelper(
              buttonText: "Proceed",
              buttonTextColor: AppColorsCommon.appWhite,
              secondaryButton: false,

            ),
          ),
        ],
      ),
    );
  }
}
