import "package:flutter/material.dart";


class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.function,
    required this.text,
  });

  final void Function() function;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: function,
        child: Text(
          text,
        ),
      ),
    );
  }
}
