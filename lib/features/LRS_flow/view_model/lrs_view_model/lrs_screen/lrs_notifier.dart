import "package:aprreciate/core/constants/app_strings/app_strings_common.dart";
import "package:aprreciate/features/LRS_flow/enums/order_validity_states.dart";
import "package:aprreciate/features/LRS_flow/enums/remitanceValidityCheck.dart";
import "package:aprreciate/features/LRS_flow/enums/textfield_states.dart";
import "package:aprreciate/features/LRS_flow/view/presentation/MPIN_bottom_sheet.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_order/lrs_transaction_provider.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_screen/lrs_screen_state.dart";
import "package:aprreciate/features/cashfree_flow/view_model/providers/cashfree_provider.dart";
import "package:aprreciate/features/profile_dashboard/enums/order_status_enum.dart";
import "package:aprreciate/models/profile_models/lrs/lrs_card_model.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class LrsNotifier extends Notifier<LrsScreenState> {
  @override
  LrsScreenState build() {
    // calls cash free provider to access bank balance
    final vmStateBank = ref.watch(cashFreeProvider);

    return LrsScreenState(
      walletBalance: 0,
      enteredAmount: "",
      submitClicked: false,
      currentBankBalance: vmStateBank.bankBalance,
      amountFieldStates: TextFieldStates.neutral,
      fxRate: AppStringsCommon.currentFxRate,
      processingDate: "",
      orderValidityStates: OrderValidityStates.neutral,
      remittanceValidityCheck: RemittanceValidityCheck.checked,
      selectedFundSource: null,
      sourceOfFunds: ['Salary', 'Income from business', 'Pension', 'Gift'],
    );
  }

  // get the entered amount and store it in state
  void deriveAmountEntered(String value) {
    state = state.copyWith(enteredAmount: value);
  }

  // check if LRS is valid
  void validateLrsOrder() {
    final amountDouble = double.tryParse(state.enteredAmount) ?? 0;
    final convertedBankBalance =
        state.currentBankBalance / AppStringsCommon.currentFxRate;

    if (state.enteredAmount.isEmpty) {
      state = state.copyWith(
        orderValidityStates: OrderValidityStates.empty,
        amountFieldStates: TextFieldStates.invalid,
        submitClicked: true,
      );
    } else if (amountDouble == 0) {
      state = state.copyWith(
        orderValidityStates: OrderValidityStates.invalid,
        amountFieldStates: TextFieldStates.invalid,
        submitClicked: true,
      );
    } else if (amountDouble >= convertedBankBalance) {
      state = state.copyWith(
        orderValidityStates: OrderValidityStates.inSufficient,
        amountFieldStates: TextFieldStates.invalid,
        submitClicked: true,
      );
    } else if (amountDouble < convertedBankBalance) {
      state = state.copyWith(
        orderValidityStates: OrderValidityStates.sufficient,
        amountFieldStates: TextFieldStates.active,
        walletBalance: amountDouble,
        submitClicked: true,

      );
    }
  }

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
  void selectSourceOfFund(String value) {
    state = state.copyWith(selectedFundSource: value);
  }

  void addLrsTransaction() {
    final amountDouble = double.tryParse(state.enteredAmount) ?? 0;

    final newTransaction = UsWalletCardModel(
      orderTypeHeader: "Bank to US wallet",
      orderAmount: amountDouble,
      orderStatus: OrderStatusEnum.submitted,
    );

    ref.read(lrsTransactionProvider.notifier).addTransaction(newTransaction);
  }
}
