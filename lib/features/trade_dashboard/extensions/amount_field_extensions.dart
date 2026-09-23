import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart';
import 'package:aprreciate/features/trade_dashboard/enums/textfield_validation_enums.dart';
import 'package:flutter/material.dart';

extension AmountFieldExtensions on TextFieldValidationEnums {
  String get amountValidationTexts {
    switch (this) {
      case TextFieldValidationEnums.empty:
        return "Amount field cannot be empty";

      case TextFieldValidationEnums.zero:
        return "Amount cannot be zero";

      case TextFieldValidationEnums.greaterThanHolding:
        return "Entered amount cannot be greater than holding";

      default:
        return "";
    }
  }

  Color get amountValidationTextColor {
    switch (this) {
      case TextFieldValidationEnums.empty:
        return AppColorsCommon.appreciateThemeError;

      case TextFieldValidationEnums.zero:
        return AppColorsCommon.appreciateThemeError;

      case TextFieldValidationEnums.greaterThanHolding:
        return AppColorsCommon.appreciateThemeError;

      default:
        return AppColorsCommon.appreciateThemeColor;
    }
  }


}
