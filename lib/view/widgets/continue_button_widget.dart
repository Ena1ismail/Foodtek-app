import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/controller/onboarding_controller.dart';
import 'package:provider/provider.dart';

import '../../app_constants.dart';

class ContinueButtonWidget extends StatelessWidget {
  String? title;
  VoidCallback? onPressed;
  List<Color>? colors;
  Color? titleColor;
  ContinueButtonWidget({super.key, required this.title, this.onPressed, this.colors, this.titleColor});

  @override
  Widget build(BuildContext context) {
    SlidesController onboardingController = Provider.of(
      context,
      listen: false,
    );
    return Container(
      height: 48.h,
      width: 307.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(69),
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
          style: TextStyle(
            fontSize: 16.sp,
            color: titleColor?? Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
