import 'package:aprreciate/features/passcode/enums/passcode_enums.dart';

class PasscodeViewModel {
  // length of passcode
  static const int reqPasscodeLength = 4;

  // users passcode
  String userPasscode = "";

  // correct passcode
  final correctPasscode = "6666";

  // incorrect pass count
  int wrongCount = 0;

  // passcode maxAttempts
  int maxAttempts = 3;

  // locked
  bool locked = false;

  // validation state
  PasscodeValidationState validationState = PasscodeValidationState.empty;

  // validation state of individual circles-
  List<PasscodeValidationState> circleStates = List.generate(
    reqPasscodeLength,
    (_) => PasscodeValidationState.empty,
  );

  // update circle colors
  void updateCircleState(){
    for(int i =0; i < reqPasscodeLength ; i++){
      if(i < userPasscode.length){
        circleStates[i] = PasscodeValidationState.active;
      }else{
        circleStates[i] = PasscodeValidationState.empty;
      }
    }
  }

  // change all circle colors as per validation
  void updateAllCircleStates(PasscodeValidationState state){
    for(int i = 0; i < reqPasscodeLength ; i++){
      if(userPasscode.length == reqPasscodeLength){
        circleStates[i] = state;
      }
    }
  }

  // register users input from keypad
  String onKeyPress(String value) {
    if (value == 'backSpace') {
      if (userPasscode.isNotEmpty) {
        userPasscode = userPasscode.substring(0, userPasscode.length - 1);
      }
    } else {
      if (userPasscode.length >= reqPasscodeLength) {
        return userPasscode;
      }
      userPasscode += value;
    }
    updateCircleState();
    return userPasscode;
  }

 // validate the user passcode
  bool validatePasscode(String value){
    if(value == correctPasscode){
      validationState = PasscodeValidationState.active;
      updateAllCircleStates(PasscodeValidationState.active);
      return true;
    }else if(value != correctPasscode) {
      wrongPasscodeCount();
      return false;
    }
    return false;
  }

  // verify if the length of passcode is as per requirement
  bool passcodeFullLength(String passcode){
    if(passcode.length == reqPasscodeLength){
      return true;
    }
     return false;
  }

  // reset passcode
  void resetPasscode(PasscodeValidationState state) {
    updateAllCircleStates(state);
    validationState = PasscodeValidationState.empty;
    userPasscode = "";
  }

  void wrongPasscodeCount(){
    wrongCount += 1;
    if(wrongCount == maxAttempts){
      locked = true;
      validationState = PasscodeValidationState.locked;
      updateAllCircleStates(PasscodeValidationState.locked);
      wrongCount = 0;
    }else {
      validationState = PasscodeValidationState.incorrect;
      updateAllCircleStates(PasscodeValidationState.incorrect);
    }
  }
}
