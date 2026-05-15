import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/features/mobile_num_validator/enums/mobile_number_enums.dart";
import "package:aprreciate/features/mobile_num_validator/view/extensions/mobile_num_extensions.dart";
import "package:flutter/material.dart";

class MobileNumViewModel {
  // safe num initials
  static const safeNum = [7, 8, 9];

  final List<String> validNumInitials = ['6', '7', '8', '9'];

  static const reqMobileNumLength = 10;

  bool wrongNumber = false;

  String errorString = "";

  bool validateNumber(String mNum) {
    if (mNum.isEmpty) {
      wrongNumber = true;
      errorString = MobileNumErrorMsgState.empty.errorText;
      return false;
    } else if (mNum.length < 10) {
      wrongNumber = true;
      errorString  = MobileNumErrorMsgState.lesserThanTenDigits.errorText;
      return false;
    } else if (!validNumInitials.contains(mNum[0])) {
      wrongNumber = true;
      errorString = MobileNumErrorMsgState.invalidNumber.errorText;
      return false;
    } else {
      reset();
      return true;
    }
  }

  void reset(){
    errorString = "";
    wrongNumber = false;
  }

  void onChanged(String value){
    reset();

    if(value.length == reqMobileNumLength){
      validateNumber(value);
    }
  }
}
