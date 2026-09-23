import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart';
import "package:flutter/material.dart";

import 'package:aprreciate/features/trade_dashboard/enums/textfield_validation_enums.dart';

extension QuantityFieldExtensions on TextFieldValidationEnums {
  String get quantityValidationTexts {
    switch (this) {
      case TextFieldValidationEnums.zero:
        return "Quantity cannot be zero";

      case TextFieldValidationEnums.empty:
        return "Quantity field cannot be empty";

      case TextFieldValidationEnums.greaterThanHolding:
        return "Entered quantity cannot be greater than holding";

      default:
        return "";
    }
  }

  Color get quantityValidationTextColor {
    switch (this) {
      case TextFieldValidationEnums.empty:
        return AppColorsCommon.appreciateThemeError;

      case TextFieldValidationEnums.zero:
        return AppColorsCommon.appreciateThemeError;

      default:
        return AppColorsCommon.appreciateThemeError;
    }
  }
}
