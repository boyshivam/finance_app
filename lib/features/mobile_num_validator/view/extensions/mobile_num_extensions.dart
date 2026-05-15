

import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_module.dart";
import "package:aprreciate/features/mobile_num_validator/enums/mobile_number_enums.dart";
import "package:flutter/material.dart";


extension MobileNumErrorMsgStateText on MobileNumErrorMsgState {

  String get errorText {

    switch (this){

      case MobileNumErrorMsgState.empty:
        return "Enter a mobile number";

      case MobileNumErrorMsgState.lesserThanTenDigits:
        return "Number should be 10 digits";

      case MobileNumErrorMsgState.invalidNumber:
        return "Enter a valid number !";
    }
  }
}


extension MobileNumContainerStateColors on MobileNumContainerState {

  Color get stateColor {

    switch(this) {

      case MobileNumContainerState.active:
        return AppColorsModule.mobileNumContainerActiveColor;

      case MobileNumContainerState.error:
        return AppColorsModule.mobileNumContainerErrorColor;

    }

  }

}