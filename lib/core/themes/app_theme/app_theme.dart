import "package:flutter/material.dart";
import "package:aprreciate/core/themes/text_theme/app_text_theme.dart";



const Color theColor = Color(0xFF0461E5);

const Color scaffoldColor = Color(0xFFEFF1F4);

final kInitialLightColor = ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: Color(0xFF0461E5));

final kInitialDarkColor = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color(0xFF0461E5));

class AppTheme {

  // light theme
  static ThemeData lightTheme = ThemeData(

    // color scheme
    colorScheme: ColorScheme.fromSeed(seedColor: theColor).copyWith(
      primary: theColor,
      secondary: theColor,
      surface: theColor,

    ),

    // text theme
    textTheme: AppTextTheme().textTheme,

    // scaffold bg color
    scaffoldBackgroundColor: scaffoldColor,

    // input decoration theme
    // inputDecorationTheme: InputDecorationTheme(
    //     enabledBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(16),
    //         borderSide: BorderSide(color: theColor, width: 2.0)
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(16),
    //         borderSide: BorderSide(color: theColor, width: 2.0 )
    //     ),
    //
    //     errorBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(16),
    //       borderSide: BorderSide(color: Colors.red, width: 2.0)
    //     ),
    //
    //     border: OutlineInputBorder(
    //     borderSide: BorderSide(color: theColor, width: 2.0),
    //       borderRadius: BorderRadius.circular(16)
    // ),
    // ),


    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStatePropertyAll(TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16
        )),
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
            vertical: 14
        )),
        backgroundColor: WidgetStatePropertyAll(theColor),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          )
        )
      )
    )
  );


  // dark theme
  static ThemeData darkTheme = ThemeData(
    colorScheme: kInitialDarkColor,
    textTheme: AppTextTheme().textTheme,

      scaffoldBackgroundColor: scaffoldColor,

      // input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: theColor)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: theColor, )
        ),

        border: OutlineInputBorder(
            borderSide: BorderSide(color: theColor),
            borderRadius: BorderRadius.circular(16)
        ),
      ),


      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              textStyle: WidgetStatePropertyAll(
                TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                )
              ),
              padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
                  vertical: 12, horizontal: 0
              )),
              backgroundColor: WidgetStatePropertyAll(theColor),
              foregroundColor: WidgetStatePropertyAll(kInitialLightColor.onPrimary),
              shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)
                  )
              ),

          ),
      )
  );

}