
import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart';
import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_module.dart';
import "package:flutter/material.dart";
import 'package:aprreciate/features/passcode/enums/passcode_enums.dart';


extension PasscodeValidationStateExtension on PasscodeValidationState {

  String get errorText {

    switch(this) {

      case PasscodeValidationState.incorrect:
        return "Invalid passcode!";

      case PasscodeValidationState.active:
        return "Passcode verified!";

      case PasscodeValidationState.locked:
        return "3 wrong attempts! Retry in";

      default:
        return "";

    }

  }

  Color get validationColorsContainerBorder {

    switch(this) {

      case PasscodeValidationState.active:
        return AppColorsCommon.appreciateThemeColor;

      case PasscodeValidationState.incorrect:
        return AppColorsCommon.appreciateThemeError;

      case PasscodeValidationState.locked:
        return AppColorsModule.passcodeIncorrectContainerBorderColor;

      default:
        return AppColorsCommon.appreciateThemeColor;
    }

  }

  Color get validationColorsCircleBorder {

    switch(this) {

      case PasscodeValidationState.empty:
        return AppColorsModule.passcodeDefaultCircleBorderColor;

      case PasscodeValidationState.incorrect:
        return AppColorsModule.passcodeIncorrectCircleBorderColor;

      case  PasscodeValidationState.active:
        return AppColorsModule.passcodeActiveCircleBorderColor;

      case PasscodeValidationState.locked:
        return AppColorsModule.passcodeIncorrectCircleBorderColor;

    }

  }


  Color get validationColorsCircleBG {

    switch(this) {
      case PasscodeValidationState.empty:
        return AppColorsModule.passcodeDefaultCircleBGColor;

      case PasscodeValidationState.active:
        return AppColorsModule.passcodeActiveCircleBGColor;

      case PasscodeValidationState.incorrect:
        return AppColorsModule.passcodeIncorrectCircleBGColor;

      case PasscodeValidationState.locked:
        return AppColorsModule.passcodeIncorrectCircleBGColor;

    }

  }

}