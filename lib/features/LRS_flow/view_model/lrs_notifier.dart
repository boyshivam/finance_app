import "package:aprreciate/core/constants/app_strings/app_strings_common.dart";
import "package:aprreciate/features/LRS_flow/enums/textfield_states.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_screen_state.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class LrsNotifier extends Notifier<LrsScreenState> {
  @override
  LrsScreenState build() {
    return LrsScreenState(
      amountText: "",
      currentYesBalance: AppStringsCommon.yesBankBalance,
      amountFieldStates: TextFieldStates.neutral,
      fxRate: AppStringsCommon.currentFxRate,
      processingDate: "",
    );
  }

  void deriveAmountEntered(String value){
    state = state.copyWith(
      amountText: value
    );
  }
}
