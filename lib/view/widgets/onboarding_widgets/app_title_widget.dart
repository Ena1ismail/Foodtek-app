import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTitleWidget extends StatelessWidget {
  const AppTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
      return Text(
        'Foodtek',
        style: GoogleFonts.protestRiot(
          color: isDarkMode? AppConstants.buttonColor: Colors.white,
          fontSize: 80.sp,
          fontWeight: FontWeight.w400,
        ),
      );
  }
}
