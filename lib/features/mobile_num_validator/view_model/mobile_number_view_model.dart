import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/mobile_num_validator/enums/mobile_number_enums.dart";
import "package:aprreciate/features/mobile_num_validator/view/extensions/mobile_num_extensions.dart";
import "package:flutter/material.dart";

class MobileNumViewModel {
  // safe num initials
  static const safeNum = [7, 8, 9];

  final List<String> validNumInitials = ['6', '7', '8', '9'];

  static const reqMobileNumLength = 10;

  MobileNumValidationState validationState = MobileNumValidationState.active;


  bool validateNumber(String mNum) {
    if (mNum.isEmpty) {
     validationState = MobileNumValidationState.empty;
      return false;
    } else if (mNum.length < 10) {
      validationState = MobileNumValidationState.lesserThanTenDigits;
      return false;
    } else if (!validNumInitials.contains(mNum[0])) {
      validationState = MobileNumValidationState.invalidNumber;
      return false;
    } else {
      reset();
      validationState = MobileNumValidationState.active;
      return true;
    }
  }

  void reset(){
    validationState = MobileNumValidationState.active;
  }

  void onChanged(String value){
    reset();
    if(value.length == reqMobileNumLength){
      validateNumber(value);
    }
  }
}
