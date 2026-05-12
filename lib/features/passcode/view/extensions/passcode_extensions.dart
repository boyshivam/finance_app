

import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_module.dart';
import "package:flutter/material.dart";


import 'package:aprreciate/features/passcode/enums/passcode_enums.dart';


extension PasscodeContainerStateColors on PasscodeContainerState {

  Color get borderColor {

    switch (this) {

      case PasscodeContainerState.active:
        return AppColorsModule.passcodeDefaultContainerBorderColor;


      case PasscodeContainerState.error:
        return AppColorsModule.passcodeIncorrectContainerBorderColor;
    }
  }
}

extension PasscodeCircleBackgroundStateColors on PasscodeCircleBackgroundState {

  Color get backgroundColor {

    switch (this) {

      case PasscodeCircleBackgroundState.error:
        return AppColorsModule.passcodeIncorrectCircleBGColor;

      case PasscodeCircleBackgroundState.active:
        return AppColorsModule.passcodeActiveCircleBGColor;

      case PasscodeCircleBackgroundState.inactive:
        return AppColorsModule.passcodeDefaultCircleBGColor;

    }
  }
}

extension PasscodeCircleBorderStateColors on PasscodeCircleBorderState {

  Color get borderColor {

    switch (this) {

      case PasscodeCircleBorderState.inactive:
        return AppColorsModule.passcodeDefaultCircleBorderColor;

      case PasscodeCircleBorderState.active:
        return AppColorsModule.passcodeActiveCircleBorderColor;

      case PasscodeCircleBorderState.error:
        return AppColorsModule.passcodeIncorrectCircleBorderColor;

    }
  }
}


extension PasscodeErrorMessageStateText on PasscodeErrorMessageState {

  String get errorText {

    switch (this) {

      case PasscodeErrorMessageState.wrongPasscode:
        return "Wrong passcode. Try Again";

      case PasscodeErrorMessageState.numpadLocked:
        return "3 wrong attempts. Retry in";

    }

  }

}
