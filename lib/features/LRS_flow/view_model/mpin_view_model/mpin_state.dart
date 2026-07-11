import 'package:aprreciate/features/LRS_flow/enums/mpin_enums/mpin_field_states.dart';
import 'package:aprreciate/features/LRS_flow/enums/mpin_enums/mpin_validity_enum.dart';

class MpinState {
  MpinState({
    required this.mpin,
    required this.offset,
    required this.mpinValidity,
    required this.mpinFieldState
  });

  final String mpin;
  double offset;
  final MpinValidity mpinValidity;
  final MpinFieldStates mpinFieldState;

  MpinState copyWith({
    String? mpin,
    double? offset,
    MpinValidity? mpinValidity,
    MpinFieldStates? mpinFieldStates,

  }) {
    return MpinState(
      mpin: mpin ?? this.mpin,
      offset: offset ?? this.offset,
      mpinValidity: mpinValidity ?? this.mpinValidity,
      mpinFieldState: mpinFieldStates ?? this.mpinFieldState
    );
  }
}
