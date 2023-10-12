import 'package:flutter/material.dart';

class MyTheme{
  static Color primaryColor=Color(0xff39A552);
  static Color whiteColor=Color(0xffFFFFFF);
  static Color redColor=Color(0xffC91C22);
  static Color blueColor=Color(0xff003E90);

  static ThemeData lightTheme=ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)
        )
      )
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Colors.black
      )
    )

  );

}