import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controller/lang_controller.dart';

class AppStyles{
  static TextStyle getFontStyle(
      LangController langController, {
        Color color = Colors.black,
        FontWeight fontWeight = FontWeight.normal,
        double fontSize = 12,
        FontStyle? fontStyle,
        TextDecoration? decoration
      }) {
    return GoogleFonts.getFont(
      langController.currentLangCode == 'ar' ? 'Cairo' : 'Inter',
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize.sp,
      fontStyle: fontStyle,
      decoration: decoration,
    );
  }
}