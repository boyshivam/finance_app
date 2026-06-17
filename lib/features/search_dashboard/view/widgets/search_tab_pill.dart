import "package:flutter/material.dart";


class SearchTabPill extends StatelessWidget {
  const SearchTabPill({super.key, required this.tab});

  final String tab;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(tab),
    );
  }
}
