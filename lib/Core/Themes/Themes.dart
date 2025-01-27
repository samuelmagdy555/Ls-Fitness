import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';

class ThemesClass{
  //lighte theme
  static final ThemeData manLightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: kSecondColor,
    secondaryHeaderColor: kFirstColor,
    focusColor: Colors.black,
    disabledColor: Colors.black12,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black, size: 30),
    cardColor: kFirstColor,
    textTheme: TextTheme(
      titleLarge: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(color: Colors.black, fontSize: 15),
      headlineSmall: TextStyle(color: Colors.black, fontSize: 10),
      labelLarge: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
      bodySmall: TextStyle(color: Colors.black, fontSize: 10),
      displayLarge: TextStyle(color: Colors.grey, fontSize: 12.5, fontWeight: FontWeight.bold),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
    ),
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: Colors.white,
      cancelButtonStyle: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.black)),
      ),
      confirmButtonStyle: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.black)),
      ),
      dividerColor: Colors.black,
    ),
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: Colors.white,
      cancelButtonStyle: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.white),
        textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.black)),
      ),
    ),
  );

  //dark theme
  static final ThemeData manDarkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: kFirstColor,
    secondaryHeaderColor: kSecondColor,
    focusColor: Colors.white,



    scaffoldBackgroundColor: Colors.black,
    iconTheme:  IconThemeData(color: Colors.white , size: 30),
      disabledColor: Colors.white24,

      cardColor: kFirstColor,
    textTheme: TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),
      titleSmall: TextStyle(color: Colors.white, fontSize: 10,fontWeight: FontWeight.bold),
      headlineLarge: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(color: Colors.white, fontSize: 15),
      headlineSmall: TextStyle(color: Colors.white, fontSize: 10),
      labelLarge: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 15 , fontWeight: FontWeight.w600),
      bodySmall: TextStyle(color: Colors.white, fontSize: 10),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,

    ),
    datePickerTheme: const DatePickerThemeData(
      backgroundColor: Colors.black,
        cancelButtonStyle: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.black,),
          textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white)),

        ),
      confirmButtonStyle: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.black,),
        textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white)),
      ),
      dividerColor: Colors.white,

    ),
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: Colors.black,
      cancelButtonStyle: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.black,),
        textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.white)),



      )
    )
  );
}