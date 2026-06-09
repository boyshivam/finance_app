import 'package:aprreciate/core/constants/app_strings/features/passcode/passcode_constants.dart';
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
      if ( state.userPasscode.length == PasscodeConstants.reqPasscodeLength) {
        state = state.copyWith(
          circleStates: List.generate(PasscodeConstants.reqPasscodeLength, (_) => validationState)
        );
      }
  }

  // register users input from keypad and adds it to passcode
  // the validation circles are colored from this
  void enterPasscode(String value) {

    if (state.locked) return;

    var passcode = state.userPasscode;

    if(value == 'backSpace'){
      if(passcode.isNotEmpty){
        passcode = passcode.substring(0, passcode.length - 1);
      }
    }else{
      if(passcode.length < PasscodeConstants.reqPasscodeLength){
        passcode += value;
      }
    }
    state = state.copyWith(userPasscode: passcode);
    updateCircleState();
  }


  // validate passcode
  bool validatePasscode(String enteredPasscode) {
    if (enteredPasscode == PasscodeConstants.correctPasscode) {
      state = state.copyWith(
        validationState: PasscodeValidationState.active,
      );
      updateAllCircleStates(PasscodeValidationState.active);
      return true;
    }
      incrementWrongPasscodeCount();
      updateAllCircleStates(PasscodeValidationState.incorrect);
      return false;
  }




  // reset passcode
  Future resetPasscode() async {
    await Future.delayed(Duration(seconds: 2));
    state = state.copyWith(
      validationState: PasscodeValidationState.empty,
      circleStates: List.generate(PasscodeConstants.reqPasscodeLength, (_) => PasscodeValidationState.empty),
      userPasscode: "",
    );
  }

  // keep count of wrong attempts
  void incrementWrongPasscodeCount() {
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


  // locked after 3 failed passcode attempts
  void setLocked(bool value) {
    state = state.copyWith(locked: value);
  }
}
