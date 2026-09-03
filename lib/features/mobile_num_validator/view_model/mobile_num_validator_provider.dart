import "package:aprreciate/features/mobile_num_validator/view_model/mobile_number_state.dart";
import "package:riverpod/riverpod.dart";
import "mobile_num_validator_notifier.dart";


final mobileNumProvider = NotifierProvider<
    MobileNumNotifier,
    MobileNumberValidatorState>(MobileNumNotifier.new);