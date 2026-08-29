import "package:aprreciate/core/constants/app_strings/features/app_strings_lrs/app_strings_lrs.dart";
import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/LRS_flow/enums/mpin_enums/mpin_field_states.dart";
import "package:aprreciate/features/LRS_flow/enums/mpin_enums/mpin_validity_enum.dart";
import "package:aprreciate/features/LRS_flow/view/widgets/Mpin_bottomsheet_widgets/mpin_input_field.dart";
import "package:aprreciate/features/LRS_flow/view/widgets/Mpin_bottomsheet_widgets/mpin_numpad.dart";
import "package:aprreciate/features/LRS_flow/view/widgets/Mpin_bottomsheet_widgets/mpin_slider.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_screen/lrs_provider.dart";
import "package:aprreciate/features/LRS_flow/view_model/mpin_view_model/mpin_provider.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class MpinBottomSheet extends ConsumerStatefulWidget {
  const MpinBottomSheet({super.key});

  @override
  ConsumerState<MpinBottomSheet> createState() => _MpinBottomSheetState();
}

class _MpinBottomSheetState extends ConsumerState<MpinBottomSheet> {
  late FocusNode mpinNode;
  late TextEditingController mpinController;

  List<FocusNode> mpinNodes = [];
  List<TextEditingController> mpinControllers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initialise the mpin notifier
    final mpinNotifier = ref.read(mpinProvider.notifier);

    mpinNodes = List.generate(AppStringLrs.mpinLength, (_) => FocusNode());
    mpinControllers = List.generate(
      AppStringLrs.mpinLength,
      (_) => TextEditingController(),
    );
    ref.listenManual(mpinProvider, (previous, next) {
      for (int i = 0; i < AppStringLrs.mpinLength; i++) {
        final value = i < next.mpin.length ? next.mpin[i] : "";
        if (mpinControllers[i].text != value) {
          mpinControllers[i].text = value;
        }
      }
      if (next.mpinValidity == MpinValidity.valid) {
        AppNavigators.goToTransactionSubmittedScreen(context);
        mpinNotifier.resetMpinState();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    for (final n in mpinNodes) {
      n.dispose();
    }
    for (final c in mpinControllers) {
      c.dispose();
    }
  }

  // move to next field incase current is filled
  void focusToNext(index) {
    if (index < AppStringLrs.mpinLength &&
        mpinControllers[index].text.isNotEmpty) {
      mpinNodes[index + 1].requestFocus();
    }
  }

  // move to previous field after erasing text in current
  void focusToPrevious(index) {
    if (index > 0 && mpinControllers[index].text.isEmpty) {
      mpinNodes[index - 1].requestFocus();
    }
  }

  // show text at particular index

  @override
  Widget build(BuildContext context) {
    final vmMpin = ref.watch(mpinProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Column(
              children: [
                Text("Enter Mpin"),
                const SizedBox(height: 10),
                MpinInputField(
                  mpinControllers: mpinControllers,
                  mpinNodes: mpinNodes,
                  focusToNext: focusToNext,
                  focusToPrevious: focusToPrevious,
                ),
                const SizedBox(height: 15),
                if (vmMpin.mpinFieldState == MpinFieldStates.empty)
                  Text(
                    "MPIN cannot be empty",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                      color: AppColorsCommon.appreciateThemeError,
                    ),
                  )
                else if (vmMpin.mpinFieldState == MpinFieldStates.incomplete)
                  Text(
                    "MPIN should be 6 characters",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                      color: AppColorsCommon.appreciateThemeError,
                    ),
                  )
                else if (vmMpin.mpinFieldState == MpinFieldStates.incorrect)
                  Text(
                    "Incorrect MPIN",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 16,
                      color: AppColorsCommon.appreciateThemeError,
                    ),
                  ),
                // else if(vmMpin.mpinFieldState == MpinFieldStates.correct)
                //   Text("Verified", style: Theme.of(context).textTheme.bodySmall!.copyWith(
                //       fontSize: 16,
                //       color: AppColorsCommon.appreciateThemeError
                //   )),
                const SizedBox(height: 15),
                MpinNumpad(),
                const SizedBox(height: 15),
                MpinSlider(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
