import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_screen/lrs_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class LrsBalanceSection extends ConsumerWidget {
  const LrsBalanceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmLrs = ref.watch(lrsProvider);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        25,
        MediaQuery.of(context).padding.top + 35,
        25,
        20,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black45.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 3,
            offset: const Offset(3, 3)
          )
        ],
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [
            AppColorsCommon.lightPurpleGradient,
            AppColorsCommon.snackBarMsgBlue,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          Text("US wallet balance"),
          const SizedBox(height: 10),
          Text(
            vmLrs.walletBalance.toStringAsFixed(2),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 32,
            ),
          ),
        ],
      ),
    );
  }
}
