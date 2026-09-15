import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/core/utils/helper_widgets/custom_navigation_button_helper.dart";
import "package:aprreciate/features/cashfree_flow/view_model/notifiers/cashfree_screen_notifier.dart";
import "package:aprreciate/features/cashfree_flow/view_model/providers/cashfree_screen_provider.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

class TransactionDetailsSection extends ConsumerStatefulWidget {
  const TransactionDetailsSection({super.key, required this.checkUpiValidity});

  final bool Function(String) checkUpiValidity;

  @override
  ConsumerState<TransactionDetailsSection> createState() =>
      _TransactionDetailsSectionState();
}

class _TransactionDetailsSectionState
    extends ConsumerState<TransactionDetailsSection> {
  final formKey = GlobalKey<FormState>();

  late final CashFreeScreenNotifier cashFreeScreenNotifier;

  @override
  void initState() {
    // TODO: implement initState
    cashFreeScreenNotifier = ref.read(cashFreeScreenProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Column(
        children: [
          _buildTransactionForm(context),

          const SizedBox(height: 250),

          _buildProceedButton(context),
        ],
      ),
    );
  }

  Widget _buildTransactionForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
            _buildLabel(context, "Enter amount to transfer"),

            const SizedBox(height: 10),

            _buildAmountField(),

            const SizedBox(height: 25),

            const Divider(thickness: 2),

            const SizedBox(height: 25),

            _buildLabel(context, "Enter UPI ID"),

            const SizedBox(height: 10),

            _buildUpiField(),

            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(BuildContext context, String text) {
    return Text(
      text,
      style: Theme.of(
        context,
      ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w900),
    );
  }

  Widget _buildAmountField() {
    return Container(
      decoration: _fieldDecoration(),
      child: TextFormField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(7),
        ],
        decoration: _fieldInputDecoration(
          prefix: const Text(
            "₹ ",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Amount cannot be empty";
          }

          final amount = double.parse(value);

          if (amount < 10) {
            return "Minimum transfer amount is ₹10";
          }

          return null;
        },
        onChanged: (value) {
          cashFreeScreenNotifier.retrieveEnteredAmount(value);
        },
      ),
    );
  }

  Widget _buildUpiField() {
    return Container(
      decoration: _fieldDecoration(),
      child: TextFormField(
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z0-9@]")),
        ],
        decoration: _fieldInputDecoration(),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "UPI ID cannot be empty";
          }

          if (!widget.checkUpiValidity(value)) {
            return "Invalid UPI ID";
          }

          return null;
        },
        onChanged: (value) {
          cashFreeScreenNotifier.retrieveEnteredUpiID(value);
        },
      ),
    );
  }

  BoxDecoration _fieldDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColorsCommon.appreciateThemeColor, width: 2),
      color: AppColorsCommon.lightPurpleGradient,
    );
  }

  InputDecoration _fieldInputDecoration({Widget? prefix}) {
    return InputDecoration(
      border: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      prefix: prefix,
    );
  }

  Widget _buildProceedButton(BuildContext context) {
    return InkWell(
      onTap: () {
        if (formKey.currentState!.validate()) {
          context.push(AppRoutes.cashFreeTransactionPlaced);
          cashFreeScreenNotifier.addToOrdersList();
          cashFreeScreenNotifier.addAmountToBankBalance();
        }
      },
      child: CustomNavigationButtonHelper(
        buttonText: "Proceed",
        secondaryButton: false,

      ),
    );
  }
}
