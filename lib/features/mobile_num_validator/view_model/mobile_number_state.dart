import "package:aprreciate/features/mobile_num_validator/enums/mobile_number_enums.dart";

class MobileNumberValidatorState {
  const MobileNumberValidatorState({
    required this.mobileNumber,
    required this.mobileNumValidationState,
  });

  final String mobileNumber;
  final MobileNumValidationEnum mobileNumValidationState;

  MobileNumberValidatorState copyWith({
    String? mobileNumber,
    MobileNumValidationEnum? mobileNumValidationState,
  }) {
    return MobileNumberValidatorState(
      mobileNumber: mobileNumber ?? this.mobileNumber,
      mobileNumValidationState:
          mobileNumValidationState ?? this.mobileNumValidationState,
    );
  }
}
