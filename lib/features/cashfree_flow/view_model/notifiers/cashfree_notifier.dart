import "package:aprreciate/features/cashfree_flow/enums/cashfree_UI_state.dart";
import "package:aprreciate/features/cashfree_flow/view_model/state/cashfree_state.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class CashFreeNotifier extends Notifier<CashFreeState> {
  @override
  CashFreeState build() {
    return CashFreeState(
      bankBalance: 0,
      enteredAmount: "",
      upiID: "",
      amountFieldState: CashFreeUIState.neutral,
      upiFieldState: CashFreeUIState.neutral,
      submitClicked: false,
    );
  }

  // get the entered amount by user
  void retrieveEnteredAmount(String amount) {
    state = state.copyWith(enteredAmount: amount);
  }

  // get the entered upi id by user
  void retrieveEnteredUpiID(String upi) {
    state = state.copyWith(upiID: upi);
  }

  // validate entered inputs
  void validateEnteredAmount() {
    final enteredAmountDouble = double.tryParse(state.enteredAmount) ?? 0;
    final enteredAmountText = state.enteredAmount.toString();

    if (enteredAmountText.trim().isEmpty) {
      state = state.copyWith(
        amountFieldState: CashFreeUIState.empty,
        submitClicked: true,
      );
    } else if (enteredAmountDouble == 0) {
      state = state.copyWith(
        amountFieldState: CashFreeUIState.invalid,
        submitClicked: true,
      );
    } else if (enteredAmountDouble > 0) {
      state = state.copyWith(
        amountFieldState: CashFreeUIState.valid,
        submitClicked: true,
        bankBalance: enteredAmountDouble
      );
    }
  }

  // validate entered UPI ID
  void validateEnteredUpiID() {
    final upiID = state.upiID;
    final upiIDSplits = upiID.split("@").length;

    if (upiID.isEmpty) {
      state = state.copyWith(
        upiFieldState: CashFreeUIState.empty,
        submitClicked: true,
      );
    } else if (upiIDSplits > 2 || upiIDSplits < 2) {
      state = state.copyWith(
        submitClicked: true,
        upiFieldState: CashFreeUIState.invalid,
      );
    } else {
      state = state.copyWith(
        upiFieldState: CashFreeUIState.valid,
        submitClicked: true,
      );
    }
  }
}
