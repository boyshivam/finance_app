import "package:aprreciate/features/LRS_flow/view_model/mpin_view_model/mpin_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class BuildKey extends ConsumerWidget {
  const BuildKey({super.key, required this.value});

  final String value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(mpinProvider.notifier).onKeyPress(value);
      },
      child: Container(
        decoration: BoxDecoration(
          // // boxShadow: [
          // //   BoxShadow(
          // //     color: Colors.grey,
          // //     blurRadius: 2,
          // //     offset: Offset(0, 2),
          // //     spreadRadius: 2
          // //   )
          // ],
          color: Colors.black.withValues(alpha: 0.1),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (value == 'backspace')
              Icon(Icons.backspace) else Text(value),
          ],
        ),
      ),
    );
  }
}
