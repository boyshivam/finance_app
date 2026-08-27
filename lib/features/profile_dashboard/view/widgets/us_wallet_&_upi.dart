import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_screen/lrs_provider.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:aprreciate/router/app_routes.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

class UsWalletUpi extends ConsumerWidget {
  const UsWalletUpi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final vmState = ref.watch(lrsProvider);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      decoration: BoxDecoration(color: AppColorsCommon.appWhite),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.person, color: Colors.lightBlue, size: 40),
                  const SizedBox(width: 15),
                  Column(
                    children: [
                      Text("Shivam"),
                      const SizedBox(height: 5),
                      Text("7005092020"),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Icon(Icons.arrow_circle_right_outlined, size: 30),
            ],
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              context.push(AppRoutes.lrsScreen);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFFAFC1FD),
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.wallet, size: 40, color: Colors.green),
                      const SizedBox(width: 15),
                      Column(
                        children: [
                          Text("US wallet"),
                          const SizedBox(height: 5),
                          Text(vmState.walletBalance!.toStringAsFixed(2), style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColorsCommon.snackBarMsgBlue
                          ),),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(Icons.arrow_circle_right_outlined),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: (){
              context.push(AppRoutes.cashFreeScreen);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Color(0xDFFFF4E9),
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.apartment, size: 30, color: Colors.indigo),
                      const SizedBox(width: 15),
                      Column(
                        children: [
                          Text("Bank Accounts"),
                          const SizedBox(height: 5),
                          Text("AXIS, SBI"),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(Icons.arrow_circle_right_outlined),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
