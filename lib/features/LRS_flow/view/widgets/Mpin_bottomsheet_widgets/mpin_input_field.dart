import "package:aprreciate/core/constants/app_strings/features/app_strings_lrs/app_strings_lrs.dart";
import "package:aprreciate/features/LRS_flow/view_model/mpin_view_model/mpin_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class MpinInputField extends ConsumerWidget {
  const MpinInputField({
    super.key,
    required this.mpinNodes,
    required this.mpinControllers,
    required this.focusToNext,
    required this.focusToPrevious
  });

  final List<FocusNode> mpinNodes;
  final List<TextEditingController> mpinControllers;
  final void Function(int index) focusToNext;
  final void Function(int index) focusToPrevious;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 80,
      child: Row(
        children: List.generate(
          AppStringLrs.mpinLength,
          (index) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: TextField(
                textAlign: TextAlign.center,
                focusNode: mpinNodes[index],
                controller: mpinControllers[index],
                maxLength: 1,
                decoration: InputDecoration(
                  counterText: ""
                ),
                onChanged: (_){
                  focusToNext(index);
                  focusToPrevious(index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
