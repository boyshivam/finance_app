import 'package:aprreciate/features/passcode/view/extensions/passcode_extensions.dart';
import 'package:aprreciate/router/app_navigators.dart';
import 'package:flutter/cupertino.dart';

import '../enums/passcode_enums.dart';

class PasscodeViewModel {
  String passcode = "";

  // delete char const
  static const deleteChar = "backSpace";

  // passcode length
  static const reqPasscodeLength = 4;

  // correct passcode
  static const correctPasscode = "6666";

  // incorrect passcode
  bool incorrectPasscode = false;

  // numpad Locked
  bool numpadLocked = false;

  // max passcode attempts
  int maxPasscodeAttempts = 3;

  // current passcode attempt count
  int attemptNum = 0;

  // passcode timer duration
  static const timerDuration = 5;

  // error incorrect passcode -
  bool get hasError {
    return incorrectPasscode || numpadLocked;
  }

  // user enters the passcode via numpad
  void enterPasscode(String value) {
    // if > 3 incorrect passcode attempts, then user cannot access the passcod
    if(value == deleteChar){
      removeChar(value);
      incorrectPasscode = false;
    }else{
      addChar(value);
    }
  }

  // delete char from passcode
  void removeChar(String value) {
      if (passcode.isNotEmpty) {
        passcode = passcode.substring(0, (passcode.length - 1));
      }
  }

  // add char to passcode
  void addChar(String value) {
    if(passcode.length <= reqPasscodeLength){
      passcode += value;
    }
  }

  // verify entered passcode
  bool verifyPasscode(String passcode) {
      if (passcode == correctPasscode) {
        return true;
      } else {
        return false;
      }
    }

  // reset passcode -
  void resetPasscode(){
    attemptNum = 0;
    passcode = "";
  }

  // passcode attempt counter
  void passcodeAttemptCount() {
    attemptNum += 1;
    passcode = "";
    if (attemptNum < maxPasscodeAttempts) {
      incorrectPasscode = true;
    } else if (attemptNum == maxPasscodeAttempts) {
      numpadLocked = true;
    }
  }
}
