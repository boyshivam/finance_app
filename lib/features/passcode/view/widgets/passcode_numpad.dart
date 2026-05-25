import "package:aprreciate/features/passcode/view/widgets/passcode_buildkey.dart";
import "package:flutter/material.dart";


class PasscodeNumpad extends StatelessWidget {
  const  PasscodeNumpad({
    super.key,
    required this.enteredPasscode,

  });

  final void Function(String) enteredPasscode;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 20
      ),
      child: SizedBox(height: 400,
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.5,
            crossAxisCount: 3,
          ),
          children: List.generate(12, (index) {
            if(index == 9){return SizedBox();}
            if(index == 10){return BuildKey(value: "0", enteredPasscode: enteredPasscode,);}
            if(index == 11){return BuildKey(value: "backSpace",  enteredPasscode: enteredPasscode);}
            return BuildKey(value: (index + 1).toString(), enteredPasscode: enteredPasscode);
          }),
        ),
      ),
    );
  }
}
