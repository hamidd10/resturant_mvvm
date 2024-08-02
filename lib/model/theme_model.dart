import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeModel{

  bool isLightMode = true;

  ThemeData lightTheme = ThemeData(
    fontFamily: GoogleFonts.lato().fontFamily,
      scaffoldBackgroundColor: Colors.grey[100],
      colorScheme: ColorScheme.light(primary: Colors.amber,secondary: Colors.grey[100]!),
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[100]
      )
  );

  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.deepPurple[900],
    colorScheme: ColorScheme.dark(primary: Colors.amber,secondary: Colors.grey[100]!),
  );

}