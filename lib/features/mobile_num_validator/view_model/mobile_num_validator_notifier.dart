import 'package:aprreciate/features/mobile_num_validator/enums/mobile_number_enums.dart';
import 'package:aprreciate/features/mobile_num_validator/view_model/mobile_number_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MobileNumNotifier extends Notifier<MobileNumberValidatorState> {
  @override
  MobileNumberValidatorState build() {
    return MobileNumberValidatorState(
      mobileNumber: "",
      mobileNumValidationState: MobileNumValidationEnum.neutral,
    );
  }

  final List<String> validNumInitials = ['6', '7', '8', '9'];

  static const reqMobileNumLength = 10;

  // derive the number entered
  void userEnteredNum(String number) {
    state = state.copyWith(mobileNumber: number);
  }

  // function to validate entered mobile number
  void validateNumber(String mNum) {
    if (mNum.isEmpty) {
      state = state.copyWith(
        mobileNumValidationState: MobileNumValidationEnum.empty,
      );
    } else if (mNum.length < 10) {
      state = state.copyWith(
        mobileNumValidationState: MobileNumValidationEnum.lesserThanTenDigits,
      );
    } else if (!validNumInitials.contains(mNum[0])) {
      state = state.copyWith(
        mobileNumValidationState: MobileNumValidationEnum.invalidNumber,
      );
    } else if (mNum.length == 10 && validNumInitials.contains(mNum[0])) {
      reset();
      state = state.copyWith(
        mobileNumValidationState: MobileNumValidationEnum.active,
      );
    }
  }

  void reset() {
    state = state.copyWith(
      mobileNumValidationState: MobileNumValidationEnum.neutral,
    );
  }
}
