import 'package:aprreciate/app.dart';
import 'package:aprreciate/core/constants/app_strings/features/app_strings_lrs/app_strings_lrs.dart';
import 'package:aprreciate/features/LRS_flow/enums/mpin_enums/mpin_field_states.dart';
import 'package:aprreciate/features/LRS_flow/enums/mpin_enums/mpin_validity_enum.dart';
import 'package:aprreciate/features/LRS_flow/view_model/mpin_view_model/mpin_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MpinNotifier extends Notifier<MpinState> {
  @override
  MpinState build() {
    return MpinState(
      mpinFieldState: MpinFieldStates.empty,
      offset: 0,
      mpinValidity: MpinValidity.invalid,
      mpin: "",
    );
  }

  // this will take input from user
  void onKeyPress(String value) {
    if (state.mpin.length < AppStringLrs.mpinLength && value != 'backspace') {
      state = state.copyWith(mpin: state.mpin + value);
    }
    if (value == 'backspace' && state.mpin.isNotEmpty) {
      state = state.copyWith(
        mpin: state.mpin.substring(0, state.mpin.length - 1),
      );
    }
  }

  // tracks the slider movement
  void sliderMovement(position, lowerLimit, upperLimit) {
    state = state.copyWith(offset: state.offset += position.delta.dx);
    state = state.copyWith(
      offset: state.offset.clamp(lowerLimit, upperLimit).toDouble(),
    );
  }

  // reset the thumb once it reaches the end of width
  void submitMpin(max) {
    if (state.offset >= max * 0.85) {
      validateMpin();
    } else {
      state = state.copyWith(offset: 0);
    }
  }

  // check the validity of mpin
  void validateMpin() {
    if (state.mpin.isEmpty) {
      state = state.copyWith(mpinFieldStates: MpinFieldStates.empty, offset: 0);
    } else if (state.mpin.length < AppStringLrs.mpinLength) {
      state = state.copyWith(mpinFieldStates: MpinFieldStates.incomplete, offset: 0);
    } else if (state.mpin != AppStringLrs.correctMpin) {
      state = state.copyWith(mpinFieldStates: MpinFieldStates.incorrect, offset: 0);
    } else if (state.mpin == AppStringLrs.correctMpin) {
      state = state.copyWith(
        mpinFieldStates: MpinFieldStates.incorrect,
        mpinValidity: MpinValidity.valid, offset: 0
      );
    }
  }
}
