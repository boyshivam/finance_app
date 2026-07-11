import "package:aprreciate/core/constants/app_strings/app_strings_common.dart";
import "package:aprreciate/features/LRS_flow/enums/order_validity_states.dart";
import "package:aprreciate/features/LRS_flow/enums/remitanceValidityCheck.dart";
import "package:aprreciate/features/LRS_flow/enums/textfield_states.dart";
import "package:aprreciate/features/LRS_flow/view/presentation/MPIN_bottom_sheet.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_screen_state.dart";
import "package:flutter/material.dart";
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
      orderValidityStates: OrderValidityStates.sufficient,
      remittanceValidityCheck: RemittanceValidityCheck.checked,
      selectedFundSource: null,
      sourceOfFunds: [
        'Salary',
        'Income from business',
        'Pension',
        'Gift'
      ]
    );
  }

  String get lrsAmount => state.amountText;

  // get the entered amount and store it in state
  void deriveAmountEntered(String value) {
    state = state.copyWith(amountText: value);
  }

  // check if LRS is valid
  void lrsValidity() {
    final lrsAmountDouble = double.tryParse(lrsAmount) ?? 0;
    if (lrsAmount.trim().isEmpty) {
      state = state.copyWith(
        orderValidityStates: OrderValidityStates.empty,
        amountFieldStates: TextFieldStates.empty,
      );
    } else if (lrsAmountDouble == 0) {
      state = state.copyWith(
        orderValidityStates: OrderValidityStates.empty,
        amountFieldStates: TextFieldStates.empty,
      );
    } else if (double.tryParse(lrsAmount)! <= state.currentYesBalance) {
      state = state.copyWith(
        orderValidityStates: OrderValidityStates.sufficient,
        amountFieldStates: TextFieldStates.active,
      );
    } else if (lrsAmountDouble > state.currentYesBalance) {
      state = state.copyWith(
        orderValidityStates: OrderValidityStates.inSufficient,
        amountFieldStates: TextFieldStates.error,
      );
    }
  }

  //
  void placeOrder() {}

  // confirm remittance
  void confirmRemittance() {}

  // toggle the remittance checkbox
  void remittanceCheckbox(bool? value) {
    state = state.copyWith(
      remittanceValidityCheck: value == true
          ? RemittanceValidityCheck.checked
          : RemittanceValidityCheck.unchecked,
    );
  }

  void showMpinBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) => MpinBottomSheet(),
    );
  }

  // select items from the
  void selectSourceOfFund(String value){
    state = state.copyWith(
      selectedFundSource: value
    );
  }

  //
}
