import 'package:aprreciate/features/mobile_otp_validator/enums/mobile_otp_enum.dart';
import 'package:aprreciate/features/mobile_otp_validator/view_model/mobile_otp_notifier/mobile_otp_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mobileOtpProvider = NotifierProvider<
    MobileOtpNotifier,
    MobileOtpValidationState>(MobileOtpNotifier.new);