import "package:aprreciate/features/cashfree_flow/enums/cashfree_UI_state.dart";
import "package:aprreciate/features/cashfree_flow/view_model/state/cashfree_state.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class CashFreeNotifier extends Notifier<CashFreeState> {
  @override
  CashFreeState build() {
    return CashFreeState(
      bankBalance: 0,
      upiID: "",
      amountFieldState: CashFreeUIState.neutral,
      upiFieldState: CashFreeUIState.neutral,
    );
  }

  // get the entered amount by user
  void retrieveEnteredAmount(String amount) {
    state = state.copyWith(bankBalance: double.tryParse(amount) ?? 0);
  }

  // get the entered upi id by user
  void retrieveEnteredUpiID(String upi) {
    state = state.copyWith(upiID: upi);
  }

  // validate entered inputs
  void validateEnteredAmount() {
    if (state.bankBalance.toString().trim().isEmpty) {
      state = state.copyWith(amountFieldState: CashFreeUIState.empty);
    } else if (state.bankBalance == 0) {
      state = state.copyWith(amountFieldState: CashFreeUIState.invalid);
    } else if (state.bankBalance > 0) {
      state = state.copyWith(amountFieldState: CashFreeUIState.valid);
    }
  }

  // validate entered UPI ID
  void validateEnteredUpiID() {
    final upiID = state.upiID;
    final upiIDSplits = upiID.split("@").length;

    if (upiID.isEmpty) {
      state = state.copyWith(upiFieldState: CashFreeUIState.empty);
    } else if (upiIDSplits > 2 || upiIDSplits < 2) {
      state = state.copyWith(upiFieldState: CashFreeUIState.invalid);
    } else {
      state = state.copyWith(upiFieldState: CashFreeUIState.valid);
    }
  }
}
