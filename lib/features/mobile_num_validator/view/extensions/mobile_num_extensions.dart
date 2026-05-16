

import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_module.dart";
import "package:aprreciate/features/mobile_num_validator/enums/mobile_number_enums.dart";
import "package:flutter/material.dart";


extension MobileNumValidationExtension on MobileNumValidationState {

  String get errorText {

    switch (this) {

      case MobileNumValidationState.empty:
        return "Number cannot be empty";

      case MobileNumValidationState.lesserThanTenDigits:
        return "Number cannot be lesser than 10 digits";

      case MobileNumValidationState.invalidNumber:
        return "Enter a valid number";

      default:
        return "";
    }

  }

  Color get borderColor {

    switch (this) {

      case MobileNumValidationState.active:
        return AppColorsModule.mobileNumContainerActiveColor;

      default:
        return AppColorsModule.mobileNumContainerErrorColor;
    }

  }


  bool get hasError {

    switch (this) {

      case MobileNumValidationState.active:
        return false;

      default:
        return true;

    }

  }

}
