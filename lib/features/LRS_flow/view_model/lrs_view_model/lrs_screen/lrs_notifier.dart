import "package:aprreciate/core/constants/app_strings/app_strings_common.dart";
import "package:aprreciate/core/utils/common_helper_enums/order_stage_enum.dart";
import "package:aprreciate/core/utils/helper_widgets/transactionID_generator.dart";
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
  LrsScreenState _initialState() {
    return LrsScreenState(
      usWalletBalance: 0,
      enteredAmount: "",
      enteredAmountDouble: 0,
      submitClicked: false,
      amountFieldStates: TextFieldStates.neutral,
      fxRate: AppStringsCommon.currentFxRate,
      processingDate: "",
      orderValidityStates: OrderValidityStates.neutral,
      remittanceValidityCheck: RemittanceValidityCheck.checked,
      selectedFundSource: SourceOfFundsEnums.none,
      isFundsSourceNone: false,
      sourceOfFunds: sourceOfFundsData,
      orderType: UsWalletOrderEnum.neutral,
      transactionID: "",
    );
  }

  // reset the lRS screen when exiting the LRS flow
  void resetState() {
    state = state.copyWith(
      enteredAmount: "",
      submitClicked: false,
      enteredAmountDouble: 0,
      amountFieldStates: TextFieldStates.neutral,
      remittanceValidityCheck: RemittanceValidityCheck.unchecked,
      orderValidityStates: OrderValidityStates.neutral,
      selectedFundSource: SourceOfFundsEnums.none,
      isFundsSourceNone: false,
      orderType: UsWalletOrderEnum.neutral,
      transactionID: "",
    );
  }

  @override
  LrsScreenState build() => _initialState();

  // get the entered amount and store it in state
  void deriveAmountEntered(String value) {
    state = state.copyWith(
      enteredAmount: value,
      enteredAmountDouble: double.tryParse(value),
    );
  }

  get enteredAmountDouble => double.tryParse(state.enteredAmount) ?? 0;

  // check if LRS is valid
  void validateLrsOrder() {
    // fetch bank balance
    final bankBalance =
        ref.read(cashFreeScreenProvider).bankBalance / state.fxRate;

    if (state.enteredAmount.isEmpty) {
      state = state.copyWith(
        orderValidityStates: OrderValidityStates.empty,
        amountFieldStates: TextFieldStates.invalid,
        submitClicked: true,
      );
      return;
    } else if (enteredAmountDouble == 0) {
      state = state.copyWith(
        orderValidityStates: OrderValidityStates.invalid,
        amountFieldStates: TextFieldStates.invalid,
        submitClicked: true,
      );
      return;
    } else if (enteredAmountDouble >= bankBalance) {
      state = state.copyWith(
        orderValidityStates: OrderValidityStates.inSufficient,
        amountFieldStates: TextFieldStates.invalid,
        submitClicked: true,
      );
      return;
    } else if (enteredAmountDouble < bankBalance) {
      state = state.copyWith(
        orderValidityStates: OrderValidityStates.sufficient,
        amountFieldStates: TextFieldStates.active,
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

  void confirmRemittance(Function checkboxSnackBar, BuildContext context) {
    if (state.remittanceValidityCheck == RemittanceValidityCheck.unchecked) {
      checkboxSnackBar();
    } else if (state.selectedFundSource == SourceOfFundsEnums.none &&
        state.isFundsSourceNone == false) {
      state = state.copyWith(isFundsSourceNone: true);
      return;
    } else if (state.remittanceValidityCheck ==
            RemittanceValidityCheck.checked &&
        state.orderValidityStates == OrderValidityStates.sufficient) {
      showMpinBottomSheet(context);
      // resetState();
    }
  }

  // add entered LRS amount to US wallet balance
  void addAmountToUSWallet() {
    final enteredLrsAmountDouble = double.tryParse(state.enteredAmount) ?? 0;
    final updatedUsWalletBalance =
        state.usWalletBalance + enteredLrsAmountDouble;
    state = state.copyWith(usWalletBalance: updatedUsWalletBalance);
  }

  // select items from the
  void selectSourceOfFund(SourceOfFundsEnums value) {
    state = state.copyWith(selectedFundSource: value);
  }

  // add the lrs transaction to US wallet
  void addLrsTransaction() {
    // generate a transaction iD for the specific order
    state = state.copyWith(transactionID: RandomOrderIdGenerator.generateId());

    final newTransaction = UsWalletCardModel(
      orderTxnId: state.transactionID,
      orderType: UsWalletOrderEnum.bankToUsWallet,
      orderAmount: enteredAmountDouble,
      orderStatus: OrderStageEnums.submitted,
    );
    ref.read(lrsTransactionProvider.notifier).addTransaction(newTransaction);
  }

  // deduct amount from LRS during trade
  void deductWalletBalanceAfterTradeOrder(double deductibleAmount) {
    state = state.copyWith(
      usWalletBalance: state.usWalletBalance - deductibleAmount,
    );
  }
}
