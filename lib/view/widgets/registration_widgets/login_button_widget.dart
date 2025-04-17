import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../app_styles.dart';
import '../../../controller/lang_controller.dart';

class LoginButtonWidget extends StatelessWidget {
  String buttonName;
  Color? buttonColor;
  Function() onPressed;
  Widget widget;
  Color? textColor;
  double? height;
  double? width;

  LoginButtonWidget({
    super.key,
    required this.buttonName,
    this.buttonColor,
    required this.onPressed,
    this.widget = const Text(""),
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Container(
      height: height ?? 48.h,
      width: width ?? 295.w,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFEFF0F6), width: 1.w),
        borderRadius: BorderRadius.circular(10.r),
        color: buttonColor ?? AppConstants.buttonColor,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Wrap(
          children: [
            widget,
            SizedBox(width: 10.w),
            Text(
              buttonName,
              style: AppStyles.getFontStyle(
                langController,
                color: textColor ?? Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
