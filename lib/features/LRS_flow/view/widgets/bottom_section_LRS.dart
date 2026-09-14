import "package:aprreciate/core/constants/app_assets/assets_home_dashboard/continue_where_you_left/assets_continue_where_left.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/core/utils/helper_widgets/custom_navigation_button_helper.dart";
import "package:aprreciate/features/LRS_flow/enums/order_validity_states.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_screen/lrs_provider.dart";
import "package:aprreciate/features/cashfree_flow/view_model/providers/cashfree_screen_provider.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class BottomSectionLrs extends ConsumerWidget {
  const BottomSectionLrs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmCashFree = ref.watch(cashFreeScreenProvider);

    final vmLRS = ref.watch(lrsProvider);

    return Container(
      height: 250,
      padding: EdgeInsets.fromLTRB(25, 35, 25, 25),
      decoration: BoxDecoration(
        color: AppColorsCommon.appWhite,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(22),
          topLeft: Radius.circular(22),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Image.asset(
                    AssetsContinueWhereLeft.yes_Bank_icon,
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Transfer via",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColorsCommon.textGrey,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    "YES BANK XX 4321",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Text("Change"),
                  const SizedBox(width: 5),
                  Icon(Icons.arrow_drop_down_circle_outlined),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                "Bank Balance",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "₹ ${vmCashFree.bankBalance.toStringAsFixed(2)}",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          InkWell(
            onTap: () {
              if (vmLRS.orderValidityStates == OrderValidityStates.sufficient) {
                context.push(AppRoutes.confirmRemittanceScreen);
              } else if (vmLRS.orderValidityStates ==
                  OrderValidityStates.inSufficient) {
                context.push(AppRoutes.cashFreeScreen);
                print("hello");
              }
            },
            child: CustomNavigationButtonHelper(
              buttonText:
                  vmLRS.orderValidityStates == OrderValidityStates.inSufficient
                  ? "Add funds to US wallet"
                  : "Transfer \$${vmLRS.enteredAmountDouble}",
              secondaryButton: false,
            ),
          ),
        ],
      ),
    );
  }
}
