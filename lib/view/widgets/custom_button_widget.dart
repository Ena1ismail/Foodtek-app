import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/controller/onboarding_controller.dart';
import 'package:provider/provider.dart';

import '../../app_constants.dart';

class CustomButtonWidget extends StatelessWidget {
  String? title;
  VoidCallback? onPressed;
  List<Color>? colors;
  Color? titleColor;
  double? borderRadius;
  TextStyle? style;
  double? height;
  double? width;

  CustomButtonWidget({
    super.key,
    required this.title,
    this.style,
    this.onPressed,
    this.colors,
    this.titleColor,
    this.borderRadius,
    this.width,
    this.height
  });

  @override
  Widget build(BuildContext context) {
    SlidesController onboardingController = Provider.of(context, listen: false);
    return Container(
      height: height ?? 48.h,
      width: width ?? 307.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 69),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors ?? [AppConstants.buttonColor, Color(0xFF0F481F)],
        ),
      ),
      child: TextButton(
        onPressed: () {
          print("Button '${title}' clicked");
          if (onPressed != null) {
            onPressed!();
          } else {
            onboardingController.navigateToNext(context);
          }
        },
        child: Text(
          title!,
          style:
              style ??
              TextStyle(
                fontSize: 16.sp,
                color: titleColor ?? Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
