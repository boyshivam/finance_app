import "package:aprreciate/features/mobile_otp_validator/enums/mobile_otp_enum.dart";

class MobileOtpViewModel {
  // length of otp
  static const otpLength = 6;

  // correct otp
  static const correctOTP = "666666";

  MobileOtpValidationState validationState = MobileOtpValidationState.inactive;

  bool validateOtp(String otp) {
    if (otp.isEmpty) {
      validationState = MobileOtpValidationState.empty;
      return false;
    } else if (otp.length < otpLength) {
      validationState = MobileOtpValidationState.lesserThanSixDigits;
      return false;
    } else if (otp != correctOTP) {
      validationState = MobileOtpValidationState.invalidOtp;
      return false;
    }
    validationState = MobileOtpValidationState.active;
    return true;
  }


}
