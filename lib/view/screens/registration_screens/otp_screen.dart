import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/l10n/app_localizations.dart';
import 'package:foodtek/view/screens/registration_screens/reset_password_screen.dart';
import 'package:foodtek/view/widgets/registration_widgets/login_button_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../../../app_constants.dart';
import '../../widgets/onboarding_widgets/app_title_widget.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFFEDF1F3), width: 1.w),
      ),
    );

    final pinController = TextEditingController();

    return Scaffold(
      backgroundColor: AppConstants.buttonColor,
      body: Stack(
        children: [
          Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/pattern.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30.h),
                    AppTitleWidget(),
                    SizedBox(height: 25.h),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 343.w,
              height: 399.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 24.h),
                    Image.asset(
                      "assets/images/otp.png",
                      height: 153.h,
                      width: 153.w,
                    ),
                    SizedBox(height: 14.h),
                    Padding(
                      padding: EdgeInsets.only(left: 40.0.sp, right: 40.sp),
                      child: Text(
                        textAlign: TextAlign.center,
                        AppLocalizations.of(context)!.verification_code_instruction,
                        style: GoogleFonts.inter(
                          color: Color(0xFF6C7278),
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Pinput(
                      keyboardType: TextInputType.number,
                      controller: pinController,
                      defaultPinTheme: defaultPinTheme,
                      length: 4,
                      onCompleted: (pin) {
                        print("Entered PIN: $pin");
                      },
                    ),
                    SizedBox(height: 24.h),
                    LoginButtonWidget(
                      buttonName: AppLocalizations.of(context)!.verify_button,
                      onPressed: () {
                        final otp = pinController.text;
                        if (otp.isNotEmpty && otp.length == 4) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResetPasswordScreen(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              content: Text(
                                AppLocalizations.of(context)!.otp_error,
                                style: TextStyle(color: Colors.black),
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                      textColor: Colors.white,
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
