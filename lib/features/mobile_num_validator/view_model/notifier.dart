

import 'package:aprreciate/features/mobile_num_validator/enums/mobile_number_enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MobileNumNotifier extends Notifier<MobileNumValidationState> {


  final List<String> validNumInitials = ['6', '7', '8', '9'];

  static const reqMobileNumLength = 10;

  MobileNumValidationState validationState = MobileNumValidationState.active;

  @override
  MobileNumValidationState build() {
    return MobileNumValidationState.active;
  }

  bool validateNumber(String mNum) {
    if (mNum.isEmpty) {
      state =  MobileNumValidationState.empty;
      return false;

    } else if (mNum.length < 10) {
      state = MobileNumValidationState.lesserThanTenDigits;
      return false;
    } else if (!validNumInitials.contains(mNum[0])) {
      state = MobileNumValidationState.invalidNumber;
      return false;
    } else {
      reset();
      state = MobileNumValidationState.active;
      return true;
    }
  }

  void reset(){
    state = MobileNumValidationState.active;
  }

  void onChanged(String value){
    reset();
    if(value.length == reqMobileNumLength){
      validateNumber(value);
    }
  }
}

