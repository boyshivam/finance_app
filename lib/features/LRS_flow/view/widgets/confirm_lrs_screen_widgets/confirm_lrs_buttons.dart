import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/LRS_flow/enums/remitanceValidityCheck.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_screen/lrs_provider.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class ConfirmLrsButtons extends ConsumerWidget {
  const ConfirmLrsButtons({super.key, required this.checkboxSnackBar});

  final void Function() checkboxSnackBar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vmState = ref.watch(lrsProvider);
    final lrsScreenNotifier = ref.read(lrsProvider.notifier);

    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 10, 25, 40),
          child: Column(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: CheckboxListTile(
                  title: Text(
                    "I agree to FEMA T&Cs, OFAC Declaration, Portfolio Investment Scheme (PIS), Hold Balance/Rejection, Role of YBL",
                  ),
                  tileColor: Color(0xFFe6e7fa),
                  value:
                      vmState.remittanceValidityCheck ==
                      RemittanceValidityCheck.checked,
                  onChanged: (value) {
                    final notifier = ref.read(lrsProvider.notifier);
                    notifier.remittanceCheckbox(value);
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Divider(
                height: 5,
                color: AppColorsCommon.appreciateThemeColor,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      AppNavigators.gotoLrsScreen(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.blueAccent, width: 2),
                      ),
                      child: Text(
                        "Cancel",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      lrsScreenNotifier.confirmRemittance(checkboxSnackBar, context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        "Confirm",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColorsCommon.appWhite,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
