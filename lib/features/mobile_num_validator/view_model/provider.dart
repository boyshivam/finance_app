import "package:aprreciate/features/mobile_num_validator/enums/mobile_number_enums.dart";
import "package:riverpod/riverpod.dart";
import "notifier.dart";


final mobileNumProvider = NotifierProvider<
    MobileNumNotifier,
    MobileNumValidationState>(MobileNumNotifier.new);