import 'package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart';
import 'package:flutter/material.dart';

class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({
    super.key,
    required this.iconFocusNode,
    required this.searchBarController,
    required this.showSearchResults,
    required this.clearText,
  });

  final FocusNode iconFocusNode;
  final TextEditingController searchBarController;
  final void Function() showSearchResults;
  final void Function() clearText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: TextField(
        controller: searchBarController,
        focusNode: iconFocusNode,
        decoration: InputDecoration(
          prefixIcon: iconFocusNode.hasFocus ? const Icon(Icons.search) : null,
          suffixIcon: iconFocusNode.hasFocus ? InkWell(onTap: clearText ,child: const Icon(Icons.close)) : null,
          filled: true,
          fillColor: AppColorsCommon.appWhite,

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(22),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColorsCommon.appreciateThemeColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(22),
          ),
        ),
        onChanged: (_){showSearchResults();},

      ),
    );
  }
}
