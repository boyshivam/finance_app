import "package:aprreciate/core/constants/app_strings/features/mobile_otp/mobile_otp_constants.dart";
import "package:aprreciate/features/mobile_otp_validator/enums/mobile_otp_enum.dart";

class MobileOtpViewModel {


  MobileOtpValidationState validationState = MobileOtpValidationState.inactive;

  bool validateOtp(String otp) {
    if (otp.isEmpty) {
      validationState = MobileOtpValidationState.empty;
      return false;
    } else if (otp.length < MobileOtpConstants.requiredPasscodeLength) {
      validationState = MobileOtpValidationState.lesserThanSixDigits;
      return false;
    } else if (otp != MobileOtpConstants) {
      validationState = MobileOtpValidationState.invalidOtp;
      return false;
    }
    validationState = MobileOtpValidationState.active;
    return true;
  }


}
