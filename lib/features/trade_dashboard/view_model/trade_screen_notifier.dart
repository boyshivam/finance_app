import "package:aprreciate/core/constants/app_strings/app_strings_common.dart";
import "package:aprreciate/features/trade_dashboard/enums/currency_toggle_states.dart";
import "package:aprreciate/features/trade_dashboard/enums/textfield_input_states.dart";
import "package:aprreciate/features/trade_dashboard/enums/trade_fields_ui_states.dart";
import "package:aprreciate/features/trade_dashboard/enums/us_wallet_funds_state.dart";
import "package:aprreciate/features/trade_dashboard/view_model/trade_ screen_state.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class TradeScreenNotifier extends Notifier<TradeScreenState> {
  @override
  TradeScreenState build() {
    // TODO: implement build
    return TradeScreenState(
      usWalletFundsState: UsWalletFundsState.sufficientFunds,
      tradeFieldsUiState: TradeFieldsUiStates.empty,
      currencyToggleState: CurrencyToggleState.toggledUsd,
      quantityByAmount: 0,
      amountByQuantity: 0,
      convertedValue: 0,
      textFieldInputStates: TextFieldInputStates.empty,
      amountText: "",
      quantityText: ""
    );
  }

  // check if amount or quantity fields are empty
  void checkIfFieldsEmpty(String amountText, String quantityText) {
    if (amountText.trim().isEmpty || quantityText.trim().isEmpty) {
      state = state.copyWith(textFieldInputStates: TextFieldInputStates.empty);
    } else {
      state = state.copyWith(
        textFieldInputStates: TextFieldInputStates.notEmpty,
      );
    }
  }



  // derive quant by amount
  void deriveQuantityByAmount(String amountText){
    // state = state.copyWith(
    //   usWalletFundsState: UsWalletFundsState.sufficientFunds,
    // );
    double amount = double.tryParse(amountText) ?? 0;
    final value = (amount / (double.parse(AppStringsCommon.stockTeslaPrice))).toStringAsFixed(2);
    state = state.copyWith(
      quantityText: value
    );
  }

  // derive amount from quant
  void  deriveAmountByQuantity(String quantityText){
    // state = state.copyWith(
    //   usWalletFundsState: UsWalletFundsState.sufficientFunds,
    // );

    double quantity = double.tryParse(quantityText) ?? 0;
    final value = (quantity * (double.parse(AppStringsCommon.stockTeslaPrice))).toStringAsFixed(2);
    state = state.copyWith(
      amountText: value
    );
  }



  // function to toggle currency and convert entered amount
  void toggleCurrency(bool change, String amountText) {
    final enteredAmount = double.parse(amountText);
    if (change) {
      state = state.copyWith(
        convertedValue:
            enteredAmount * double.parse(AppStringsCommon.currentFxRate),
      );
    } else {
      state = state.copyWith(
        convertedValue:
            enteredAmount / double.parse(AppStringsCommon.currentFxRate),
      );
    }

    state = state.copyWith(
      currencyToggleState: change
          ? CurrencyToggleState.toggledUsd
          : CurrencyToggleState.toggledInr,
    );
  }



  // check if order can be placed based on balance in US wallet and
  void checkOrderValidity(String amountText) {
    double enteredAmount = double.tryParse(amountText.trim()) ?? 0;

    if (enteredAmount > double.parse(AppStringsCommon.USWalletBalance) ||
        enteredAmount > double.parse(AppStringsCommon.stockTeslaPrice)) {
      state = state.copyWith(
        usWalletFundsState: UsWalletFundsState.insufficientFunds
      );
    }
    if (enteredAmount == 0) {
      state = state.copyWith(
        textFieldInputStates: TextFieldInputStates.empty
      );
    } else {
      state = state.copyWith(
        textFieldInputStates: TextFieldInputStates.notEmpty
      );
      if (enteredAmount <= double.parse(AppStringsCommon.USWalletBalance)) {
        state = state.copyWith(
          usWalletFundsState: UsWalletFundsState.sufficientFunds
        );
      }
    }
  }

  void clearInputField(){
    state = state.copyWith(
      usWalletFundsState: UsWalletFundsState.sufficientFunds,
      tradeFieldsUiState: TradeFieldsUiStates.empty,
      textFieldInputStates: TextFieldInputStates.empty,
      quantityByAmount: 0,
      amountByQuantity: 0,
      convertedValue: 0
    );
  }

}
