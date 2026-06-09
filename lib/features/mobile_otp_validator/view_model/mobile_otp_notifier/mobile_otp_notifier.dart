

import 'package:aprreciate/core/constants/app_strings/features/mobile_otp/mobile_otp_constants.dart';
import 'package:aprreciate/features/mobile_otp_validator/enums/mobile_otp_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MobileOtpNotifier extends Notifier<MobileOtpValidationState> {

  static const otpLength = 6;

  // correct otp
  static const correctOTP = "666666";


  @override
  MobileOtpValidationState build() {
    return MobileOtpValidationState.inactive;
  }

  bool validateOtp(String otp) {
    if (otp.isEmpty) {
      state = MobileOtpValidationState.empty;
      return false;
    } else if (otp.length < MobileOtpConstants.requiredPasscodeLength) {
      state = MobileOtpValidationState.lesserThanSixDigits;
      return false;
    } else if (otp != MobileOtpConstants.correctOtp) {
      state = MobileOtpValidationState.invalidOtp;
      return false;
    }
    state = MobileOtpValidationState.active;
    return true;
  }

  void resetOtp() {
    state = MobileOtpValidationState.inactive;
  }


}