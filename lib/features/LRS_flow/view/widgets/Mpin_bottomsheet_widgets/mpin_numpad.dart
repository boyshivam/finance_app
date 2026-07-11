import "package:aprreciate/features/LRS_flow/view/widgets/Mpin_bottomsheet_widgets/build_key.dart";
import "package:flutter/material.dart";

class MpinNumpad extends StatelessWidget {
  const MpinNumpad({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2.2,
          crossAxisCount: 3,
          crossAxisSpacing: 50,
          mainAxisSpacing: 20,
        ),
        children: List.generate(
          12,
          (index) {
            if(index == 9){return SizedBox();}
            if(index == 10){return BuildKey(value: "0");}
            if(index == 11){return BuildKey(value: "backspace");}
            return BuildKey(value: (index + 1).toString());
          }
        ),
      ),
    );
  }
}
