import "package:flutter/material.dart";

class BuildKey extends StatelessWidget {
  const BuildKey({
    super.key,
    required this.value,
    required this.enteredPasscode,
  });

  final String value;
  final void Function(String value) enteredPasscode;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){enteredPasscode(value);},
      child:  Container(
          width: 80, height: 80,
          alignment: Alignment.center,
          child:
          Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 24,
            ),
          ),
        ),
      );
  }
}
