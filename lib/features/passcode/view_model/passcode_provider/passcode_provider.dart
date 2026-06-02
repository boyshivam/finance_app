import 'package:aprreciate/features/passcode/enums/passcode_enums.dart';
import 'package:aprreciate/features/passcode/view_model/passcodeState.dart';
import 'package:aprreciate/features/passcode/view_model/passcode_notifier/passcode_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final passcodeProvider = NotifierProvider<
    PasscodeNotifier,
    PasscodeState>(PasscodeNotifier.new);