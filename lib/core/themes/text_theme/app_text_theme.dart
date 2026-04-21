import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";


class AppTextTheme {

  final TextTheme textTheme = TextTheme(

    // Headlines font size

    headlineLarge: GoogleFonts.manrope().copyWith(
      fontWeight: FontWeight.w900,
      fontSize: 36
    ),


    // body font sized

    bodyMedium: GoogleFonts.manrope().copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 20
    ),

    bodySmall: GoogleFonts.manrope().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w200
    )

  );

}