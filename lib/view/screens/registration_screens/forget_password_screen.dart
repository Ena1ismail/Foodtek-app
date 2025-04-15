import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/view/widgets/onboarding_widgets/app_title_widget.dart';
import 'package:foodtek/view/widgets/onboarding_widgets/back_arrow_widget.dart';
import 'package:foodtek/view/widgets/registration_widgets/email_field_widget.dart';
import 'package:foodtek/view/widgets/registration_widgets/login_button_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../controller/login_controller.dart';
import '../../../l10n/app_localizations.dart';
import 'otp_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Provider.of<LoginController>(
      context,
      listen: false,
    );

    return Scaffold(
      backgroundColor: AppConstants.buttonColor,
      body: _buildBody(context, loginController),
    );
  }

  Widget _buildBody(BuildContext context, LoginController loginController) {
    return Center(
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
              _buildContentCard(context, loginController),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentCard(
    BuildContext context,
    LoginController loginController,
  ) {
    return Center(
      child: Container(
        width: 343.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
        ),
        child: Selector<LoginController, bool>(
          selector: (context, loginController) => loginController.isLoginMode,
          builder: (context, isLoginMode, _) {
            return Column(
              children: [
                _backIconButton(context, loginController),
                _buildTitle(),
                _buildSubTitle(),
                SizedBox(height: 24.h),
                EmailFieldWidget(loginController: loginController),
                SizedBox(height: 24.h),
                LoginButtonWidget(
                  buttonName: AppLocalizations.of(context)!.send_button,
                  onPressed: () {
                    loginController.validateField(
                      context: context,
                      field: 'email',
                      value: loginController.emailController.text,
                    );
                    if (loginController.errors['email'] == null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OTPScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Please fix the errors before proceeding.",
                            style: TextStyle(color: Colors.black),
                          ),
                          backgroundColor: Colors.white,
                        ),
                      );
                    }
                  },
                  textColor: Colors.white,
                ),
                SizedBox(height: 24.h),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _backIconButton(
    BuildContext context,
    LoginController loginController,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 12.sp, top: 12.sp),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            BackArrowWidget(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(width: 6.w),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.grey),
                children: [
                  TextSpan(
                    text: 'Back to ',
                    style: GoogleFonts.inter(
                      color: Color(0xFF6C7278),
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  TextSpan(
                    text: 'Login',
                    style: GoogleFonts.inter(
                      color: AppConstants.buttonColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                    ),
                  ),
                  TextSpan(
                    text: ' page?',
                    style: GoogleFonts.inter(
                      color: Color(0xFF6C7278),
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(top: 24.sp, left: 60.sp, right: 60.sp),
      child: Text(
        "Reset Password",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          color: const Color(0xFF111827),
          fontWeight: FontWeight.w700,
          fontSize: 32.sp,
        ),
      ),
    );
  }

  Widget _buildSubTitle() {
    return Padding(
      padding: EdgeInsets.only(top: 12.sp, left: 45.sp, right: 45.sp),
      child: Text(
        "Enter your E-mail or phone and we'll send you a link to get back into your account",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          color: Color(0xFF6C7278),
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
