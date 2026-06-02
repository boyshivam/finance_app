
import 'package:aprreciate/features/passcode/enums/passcode_enums.dart';

class PasscodeState {
  const PasscodeState({

    required this.validationState,
    required this.userPasscode,
    required this.circleStates,
    required this.locked,
    required this.wrongCount,

});

  final PasscodeValidationState validationState;
  final String userPasscode;
  final List<PasscodeValidationState> circleStates;
  final bool locked;
  final int wrongCount;

  PasscodeState copyWith({
    PasscodeValidationState ? validationState,
    String ? userPasscode,
    List<PasscodeValidationState>? circleStates,
    bool? locked,
    int? wrongCount,
}){
    return PasscodeState(
      validationState:
      validationState ?? this.validationState,
      userPasscode:
      userPasscode ?? this.userPasscode,
      circleStates:
      circleStates ?? this.circleStates,
      locked:
      locked ?? this.locked,
      wrongCount:
      wrongCount ?? this.wrongCount,
    );
  }

}