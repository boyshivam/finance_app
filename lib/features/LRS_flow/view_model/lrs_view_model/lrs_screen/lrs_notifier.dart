import "package:aprreciate/core/constants/app_strings/app_strings_common.dart";
import "package:aprreciate/core/utils/common_helper_enums/order_stage_enum.dart";
import "package:aprreciate/features/LRS_flow/data/source_of_funds_data.dart";
import "package:aprreciate/features/LRS_flow/enums/order_validity_states.dart";
import "package:aprreciate/features/LRS_flow/enums/remitanceValidityCheck.dart";
import "package:aprreciate/features/LRS_flow/enums/textfield_states.dart";
import "package:aprreciate/features/LRS_flow/enums/us_wallet_order_enum.dart";
import "package:aprreciate/features/LRS_flow/enums/source_of_funds_enums.dart";
import "package:aprreciate/features/LRS_flow/view/presentation/MPIN_bottom_sheet.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_order/lrs_transaction_provider.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_screen/lrs_screen_state.dart";
import "package:aprreciate/features/cashfree_flow/view_model/providers/cashfree_screen_provider.dart";
import "package:aprreciate/models/profile_models/lrs/lrs_card_model.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class LrsNotifier extends Notifier<LrsScreenState> {
  @override
  LrsScreenState build() {
    // calls cash free provider to access bank balance
    final vmBank = ref.watch(cashFreeScreenProvider);

    return LrsScreenState(
      walletBalance: 0,
      enteredAmount: "",
      enteredAmountDouble: 0,
      submitClicked: false,
      currentBankBalance: vmBank.bankBalance,
      bankBalanceInUSD: vmBank.bankBalance / AppStringsCommon.currentFxRate,
      amountFieldStates: TextFieldStates.neutral,
      fxRate: AppStringsCommon.currentFxRate,
      processingDate: "",
      orderValidityStates: OrderValidityStates.neutral,
      remittanceValidityCheck: RemittanceValidityCheck.checked,
      selectedFundSource: SourceOfFundsEnums.none,
      isFundsSourceNone: false,
      sourceOfFunds: sourceOfFundsData,
      orderType: UsWalletOrderEnum.neutral,
    );
  }

  // get the entered amount and store it in state
  void deriveAmountEntered(String value) {
    state = state.copyWith(
      enteredAmount: value,
      enteredAmountDouble: double.tryParse(value),
    );
  }

  // check if LRS is valid
  void validateLrsOrder() {
    final amountDouble = double.tryParse(state.enteredAmount) ?? 0;
    final bankBalanceInUSD = state.bankBalanceInUSD;

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
    } else if (amountDouble >= bankBalanceInUSD) {
      state = state.copyWith(
        orderValidityStates: OrderValidityStates.inSufficient,
        amountFieldStates: TextFieldStates.invalid,
        submitClicked: true,
      );
    } else if (amountDouble < bankBalanceInUSD) {
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

  // reset the state of all components to neutral
  void resetState() {
    state = state.copyWith(
      submitClicked: false,
      orderValidityStates: OrderValidityStates.neutral,
      amountFieldStates: TextFieldStates.neutral,
      selectedFundSource: SourceOfFundsEnums.none,
      isFundsSourceNone: false,
    );
  }

  void confirmRemittance(Function checkboxSnackBar, BuildContext context) {
    if (state.remittanceValidityCheck == RemittanceValidityCheck.unchecked) {
      checkboxSnackBar();
    } else if (state.selectedFundSource == SourceOfFundsEnums.none &&
        state.isFundsSourceNone == false) {
      state = state.copyWith(isFundsSourceNone: true);
      return;
    } else if (state.remittanceValidityCheck ==
        RemittanceValidityCheck.checked) {
      showMpinBottomSheet(context);
      resetState();
    }
  }

  // select items from the
  void selectSourceOfFund(SourceOfFundsEnums value) {
    state = state.copyWith(selectedFundSource: value);
  }


  // add the lrs transaction to US wallet
  void addLrsTransaction() {
    final amountDouble = double.tryParse(state.enteredAmount) ?? 0;

    final newTransaction = UsWalletCardModel(
      orderType: UsWalletOrderEnum.bankToUsWallet,
      orderAmount: amountDouble,
      orderStatus: OrderStageEnums.submitted,
    );
    ref.read(lrsTransactionProvider.notifier).addTransaction(newTransaction);
  }
}
