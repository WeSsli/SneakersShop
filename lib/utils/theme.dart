import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  //Light theme
  static final ThemeData light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Color(0xFFF5F5F5),
    primaryColor: Color(0xFF403B58),
    primaryColorDark: Color(0xFF1F775C),
    accentColor: Color(0xFF218B5E),
    iconTheme: IconThemeData(
      color: Color(0xFFADB0BC),
    ),
    textTheme: GoogleFonts.quicksandTextTheme().apply(
      displayColor: Color(0xFF403B58),
      bodyColor: Color(0xFF403B58),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
    ),
  );
}
