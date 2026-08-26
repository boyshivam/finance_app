import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/cashfree_flow/enums/cashfree_UI_state.dart";
import "package:aprreciate/features/cashfree_flow/view_model/providers/cashfree_provider.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

class ProceedPayCta extends ConsumerWidget {
  const ProceedPayCta({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(cashFreeProvider.notifier);
    final vmState = ref.watch(cashFreeProvider);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: InkWell(
        onTap: () {

          if (vmState.amountFieldState == CashFreeUIState.valid &&
              vmState.upiFieldState == CashFreeUIState.valid) {
            context.push(AppRoutes.cashFreeTransactionPlaced);
          }
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColorsCommon.snackBarMsgBlue,
          ),
          child: Text(
            "Proceed To Pay",
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(color: AppColorsCommon.appWhite),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
