import 'package:flutter/material.dart';

class ThemesClass{
  //lighte theme
  static final ThemeData manLightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
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

  //dark theme
  static final ThemeData manDarkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    secondaryHeaderColor: Colors.white30
      ,
    scaffoldBackgroundColor: Colors.black,
    iconTheme:  IconThemeData(color: Colors.white , size: 30),
    navigationBarTheme:  NavigationBarThemeData(

    ),

    textTheme: TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
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