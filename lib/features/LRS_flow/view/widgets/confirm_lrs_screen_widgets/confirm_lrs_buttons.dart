import "package:aprreciate/features/LRS_flow/view_model/lrs_view_model/lrs_provider.dart";
import "package:aprreciate/router/app_navigators.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";


class ConfirmLrsButtons extends ConsumerWidget {
  const ConfirmLrsButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.grey,
      child: Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: (){
                AppNavigators.gotoLrsScreen(context);
              },
              child: Container(
                color: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text("Cancel"),
              ),
            ),
            InkWell(
              onTap: (){
                ref.read(lrsProvider.notifier).showMpinBottomSheet(context);
              },
              child: Container(
                color: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text("Confirm"),
              ),
            ),
          ],
        ),),
    );
  }
}
