import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../app_styles.dart';
import '../../../controller/lang_controller.dart';

class EmptyWidget extends StatelessWidget {
  String title;
  String subTitle;

  EmptyWidget({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/empty.png", height: 285.h, width: 285.w),
          SizedBox(height: 50.h),
          Center(
            child: Text(
              title,
              style: AppStyles.getFontStyle(
                langController,
                fontSize: 32.sp,
                fontWeight: FontWeight.w700,
                color: isDarkMode? Colors.white: Color(0xFF111827),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            textAlign: TextAlign.center,
            subTitle,
            style: AppStyles.getFontStyle(
              langController,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
