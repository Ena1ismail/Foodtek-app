import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTitleWidget extends StatelessWidget {
  const AppTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
      return Text(
        'Foodtek',
        style: GoogleFonts.protestRiot(
          color: Theme.of(context).scaffoldBackgroundColor,
          fontSize: 80.sp,
          fontWeight: FontWeight.w400,
        ),
      );
  }
}
