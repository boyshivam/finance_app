import "dart:math";
import "package:aprreciate/core/constants/app_strings/app_strings_common.dart";
import "package:aprreciate/core/utils/common_helper_enums/order_stage_enum.dart";
import "package:aprreciate/core/utils/helper_widgets/transactionID_generator.dart";
import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_screen/lrs_provider.dart";
import "package:aprreciate/features/portfolio_dashboard/view_model/provider/portfolio_holdings_provider.dart";
import "package:aprreciate/features/profile_dashboard/enums/trade_order_type_enums.dart";
import "package:aprreciate/features/profile_dashboard/view_model/view_model_orders/providers/orders_provider.dart";
import "package:aprreciate/features/trade_dashboard/enums/currency_toggle_states.dart";
import "package:aprreciate/features/trade_dashboard/enums/fees_view_states.dart";
import "package:aprreciate/features/trade_dashboard/enums/order_eligibility_states.dart";
import "package:aprreciate/features/trade_dashboard/enums/text_field_error_message_states.dart";
import "package:aprreciate/features/trade_dashboard/enums/trade_fields_states.dart";
import "package:aprreciate/features/trade_dashboard/enums/trade_type_enum.dart";
import "package:aprreciate/features/trade_dashboard/enums/us_wallet_funds_state.dart";
import "package:aprreciate/features/trade_dashboard/view_model/trade_screen_view_model/trade_%20screen_state.dart";
import "package:aprreciate/models/portfolio_holding_model/portfolio_holding_card_model.dart";
import "package:aprreciate/models/profile_models/orders/order_card_model.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class TradeScreenNotifier extends Notifier<TradeScreenState> {
  TradeScreenState _initialState() {
    final vmLrs = ref.watch(lrsProvider);

    // TODO: implement build
    return TradeScreenState(
      securityName: "",
      securitySymbol: "",
      securityIcon: "",
      tradeType: TradeTypeEnum.buyFraction,
      usWalletFundsState: UsWalletFundsState.sufficientFunds,
      amountTextFieldState: TextFieldsStates.neutral,
      quantityTextFieldState: TextFieldsStates.neutral,
      amountTextFieldErrorMessageState: TextFieldErrorMessageState.neutral,
      quantityTextFieldErrorMessageState: TextFieldErrorMessageState.neutral,
      currencyToggleState: CurrencyToggleState.toggledUsd,
      usWalletBalance: vmLrs.usWalletBalance,
      quantityByAmount: 0,
      amountByQuantity: 0,
      convertedValue: 0,
      amountText: "",
      quantityText: "",
      orderValueText: "",
      amountPayable: "",
      transactionFee: "",
      platformFee: "",
      orderEligibility: OrderEligibilityStates.invalid,
      feesViewStates: FeesViewStates.partialView,
      totalFees: "",
      stockPrice: AppStringsCommon.stockTeslaPrice,
    );
  }

  @override
  TradeScreenState build() => _initialState();

  // this alters the state of currency toggle
  void toggleCurrency() {
    final enteredAmount = double.tryParse(state.amountText) ?? 0;

    final isUsd = state.currencyToggleState == CurrencyToggleState.toggledUsd;

    state = state.copyWith(
      currencyToggleState: isUsd
          ? CurrencyToggleState.toggledInr
          : CurrencyToggleState.toggledUsd,
      amountText:
          (isUsd
                  ? enteredAmount * AppStringsCommon.currentFxRate
                  : enteredAmount / AppStringsCommon.currentFxRate)
              .toStringAsFixed(2),
    );
  }

  // derive quantity from quantity controller
  void deriveQuantity(String value) {
    state = state.copyWith(quantityText: value);
  }

  // derive amount from the amount controller
  void deriveAmount(String value) {
    state = state.copyWith(amountText: value);
  }

  // get amount in double
  double get enteredAmount => double.parse(state.amountText);

  // get quantity in double
  double get enteredQuantity => double.tryParse(state.quantityText) ?? 0;

  // shown quantity secured for the entered amount in the quantity text field -
  void quantityByAmount() {
    // quantity to be display in quantity field
    final securedQuantity = (enteredAmount / state.stockPrice).toStringAsFixed(
      2,
    );
    state = state.copyWith(quantityText: securedQuantity);
  }

  // show amount secured by entered quantity in the quantity text field
  void amountByQuantity() {
    final enteredQuantity = double.tryParse(state.quantityText) ?? 0;

    // this is amount to be displayed in the amount field
    final securedAmount = (enteredQuantity * state.stockPrice).toStringAsFixed(
      2,
    );
    state = state.copyWith(amountText: securedAmount);
  }

  // check trade amount validity
  void validateTradeOrder() {
    if (state.amountText.trim().isEmpty) {
      state = state.copyWith(
        amountTextFieldState: TextFieldsStates.empty,
        amountTextFieldErrorMessageState: TextFieldErrorMessageState.empty,
        orderEligibility: OrderEligibilityStates.invalid,
      );
      return;
    } else if (enteredAmount == 0) {
      state = state.copyWith(
        amountTextFieldState: TextFieldsStates.zero,
        amountTextFieldErrorMessageState: TextFieldErrorMessageState.zero,
        orderEligibility: OrderEligibilityStates.invalid,
      );
      return;
    } else if (enteredAmount > state.usWalletBalance) {
      state = state.copyWith(
        amountTextFieldState: TextFieldsStates.error,
        amountTextFieldErrorMessageState: TextFieldErrorMessageState.error,
        orderEligibility: OrderEligibilityStates.invalid,
      );
      return;
    } else if (enteredAmount <= state.usWalletBalance) {
      state = state.copyWith(
        amountTextFieldState: TextFieldsStates.active,
        amountTextFieldErrorMessageState: TextFieldErrorMessageState.active,
        orderEligibility: OrderEligibilityStates.valid,
        usWalletFundsState: UsWalletFundsState.sufficientFunds,
      );
    }
  }

  // place the trade order
  void placeTradeOrder() {
    if (state.orderEligibility == OrderEligibilityStates.valid &&
        state.usWalletFundsState == UsWalletFundsState.sufficientFunds) {
      addTradeOrderToOrdersHistory();
      addSecurityToPortfolio();
      resetState();
    }
    return;
  }

  // get security details
  void getSecurityDetails(String name, String symbol, String icon) {
    state = state.copyWith(
      securityName: name,
      securitySymbol: symbol,
      securityIcon: icon,
    );
  }

  // add trade order to orders listing in profile
  void addTradeOrderToOrdersHistory() {
    final vmOrdersNotifier = ref.read(ordersProvider.notifier);

    final newOrder = TradeOrderCardModel(
      orderStatus: OrderStageEnums.submitted,
      security: state.securitySymbol,
      orderAmount: enteredAmount,
      orderQuantity: enteredQuantity,
      orderType: TradeOrderTypeEnums.buyFraction,
      transactionID: RandomOrderIdGenerator.generateId(),
    );

    vmOrdersNotifier.addOrderDetailsToCard(newOrder);
  }

  // add investment to portfolio or add investment to exiting portfolio
  void addSecurityToPortfolio() {
    double securityPrice = state.stockPrice;
    double averageCost = enteredAmount / enteredQuantity;
    double totalPnL = (securityPrice - averageCost) * enteredQuantity;

    final newHolding = PortfolioHoldingCardModel(
      securityName: state.securityName,
      securityIcon: state.securityIcon,
      securitySymbol: state.securitySymbol,
      securityPrice: securityPrice,
      investedAmount: enteredAmount,
      purchasedQuantity: enteredQuantity,
      average: averageCost,
      totalPnL: totalPnL,
    );

    final holdingsNotifier = ref.read(portfolioHoldingsProvider.notifier);
    holdingsNotifier.addHolding(
      newHolding: newHolding,
      securitySymbol: state.securitySymbol,
    );
  }

  // fees view dropdown
  void feesViewDropdown() {
    final currentState = state.feesViewStates;

    state = state.copyWith(
      feesViewStates: currentState == FeesViewStates.partialView
          ? FeesViewStates.fullView
          : FeesViewStates.partialView,
    );
  }

  // fees for the entered amount
  void calculateFees() {
    double platformFee = (enteredAmount / state.stockPrice).ceil() * 0.01;
    final transactionFee = max(0.05, (0.05 / 100) * enteredAmount);

    state = state.copyWith(
      totalFees: (platformFee + transactionFee).toStringAsFixed(2),
      orderValueText: enteredAmount.toString(),
      amountPayable: (enteredAmount + transactionFee).toStringAsFixed(2),
      transactionFee: transactionFee.toStringAsFixed(2),
      platformFee: platformFee.toStringAsFixed(2),
    );
  }

  // reset orders
  void resetOrderValidity() {
    state = state.copyWith(orderEligibility: OrderEligibilityStates.invalid);
  }

  // reset trade screen state
  void resetState() {
    state = _initialState();
  }
}
