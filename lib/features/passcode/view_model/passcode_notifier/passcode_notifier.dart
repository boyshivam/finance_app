import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:aprreciate/features/passcode/enums/passcode_enums.dart';
import '../passcodeState.dart';

class PasscodeNotifier extends Notifier<PasscodeState> {
  @override
  PasscodeState build() {
    return PasscodeState(
      validationState: PasscodeValidationState.empty,
      userPasscode: "",
      circleStates: List.generate(4, (_) => PasscodeValidationState.empty),
      locked: false,
      wrongCount: 0,
    );
  }

  static const int reqPasscodeLength = 4;


  // correct passcode
  final correctPasscode = "6666";

  // update circle colors
  void updateCircleState() {
    final circles = List.of(state.circleStates);

    for (int i = 0; i < 4; i++) {
      circles[i] = i < state.userPasscode.length
          ? PasscodeValidationState.active
          : PasscodeValidationState.empty;
    }
    state = state.copyWith(circleStates: circles);
  }

  // change all circle colors as per validation
  void updateAllCircleStates(PasscodeValidationState validationState) {
      if ( state.userPasscode.length == reqPasscodeLength) {
        state = state.copyWith(
          circleStates: List.generate(reqPasscodeLength, (_) => validationState)
        );
      }
  }


  // register users input from keypad
  String onKeyPress(String value) {
    var passcode = state.userPasscode;

    if (value == 'backSpace') {
      if (passcode.isNotEmpty) {
        passcode = passcode.substring(0, passcode.length - 1);
      }
    } else {
      if (passcode.length < 4) {
        passcode += value;
      }
    }
    state = state.copyWith(userPasscode: passcode);
    updateCircleState();

    return passcode;
  }

  // validate passcode
  bool validatePasscode(String value) {
    if (value == correctPasscode) {
      state = state.copyWith(
        validationState: PasscodeValidationState.active,
        circleStates: List.generate(4, (_) => PasscodeValidationState.active),
      );
      updateAllCircleStates(PasscodeValidationState.active);
      return true;
    } else if (value != correctPasscode) {
      wrongPasscodeCount();
      updateAllCircleStates(PasscodeValidationState.incorrect);
      return false;
    }
    return false;
  }

  // verify if the length of passcode is as per requirement
  bool passcodeFullLength(String passcode) {
    if (passcode.length == reqPasscodeLength) {
      return true;
    }
    return false;
  }

  // reset passcode
  void resetPasscode(currentStare) {
    state = state.copyWith(
      validationState: PasscodeValidationState.empty,
      circleStates: List.generate(4, (_) => PasscodeValidationState.empty),
      userPasscode: "",
    );
  }

  // keep count of wrong attempts
  void wrongPasscodeCount() {
    final count = state.wrongCount + 1;
    if (count >= 3) {
      state = state.copyWith(
        validationState: PasscodeValidationState.locked,
        locked: true,
        wrongCount: 0,
      );
    } else {
      state = state.copyWith(
        validationState: PasscodeValidationState.incorrect,
        wrongCount: count,
      );
    }
  }


  // locked when after 3 failed passcode attempts
  void setLocked(bool value) {
    state = state.copyWith(locked: value);
  }
}
