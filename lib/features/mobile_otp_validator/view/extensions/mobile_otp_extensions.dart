

import 'dart:ui';

import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_module.dart';
import 'package:aprreciate/features/mobile_otp_validator/enums/mobile_otp_enum.dart';

extension MobileOtpExtensions on MobileOtpValidationState {

  String get errorText {

    switch (this) {

      case MobileOtpValidationState.empty:
        return "OTP cannot be empty";

      case MobileOtpValidationState.lesserThanSixDigits:
        return "OTP cannot be lesser than 6 digits";

      case MobileOtpValidationState.invalidOtp:
        return "Invalid OTP";

      default:
        return "";

    }
  }

  Color get validationColor {

    switch(this) {

      case MobileOtpValidationState.active:
        return AppColorsModule.otpBoxActiveStateColor;

      case MobileOtpValidationState.inactive:
        return AppColorsModule.otpBoxDefaultStateColor;

      default:
        return AppColorsModule.otpBoxErrorStateColor;
    }
  }


  bool get hasError {

    switch(this) {

      case MobileOtpValidationState.active:
        return false;

      case MobileOtpValidationState.inactive:
        return false;

      default:
        return true;

    }

  }

}