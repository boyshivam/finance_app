import "package:flutter/material.dart";

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({super.key, required this.labelText, required this.iconText});

  final String labelText;
  final String iconText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(iconText),
        const SizedBox(height: 5),
        Text(labelText, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
