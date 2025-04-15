import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/controller/login_controller.dart';
import 'package:foodtek/view/screens/registration_screens/forget_password_screen.dart';
import 'package:foodtek/view/screens/main_screen.dart';
import 'package:foodtek/view/screens/registration_screens/sign_up_screen.dart';
import 'package:foodtek/view/widgets/onboarding_widgets/app_title_widget.dart';
import 'package:foodtek/view/widgets/registration_widgets/email_field_widget.dart';
import 'package:foodtek/view/widgets/registration_widgets/login_button_widget.dart';
import 'package:foodtek/view/widgets/registration_widgets/password_field_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../app_styles.dart';
import '../../../controller/lang_controller.dart';
import '../../../controller/secure_storage_controller.dart';
import '../../../l10n/app_localizations.dart';
import '../home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF25AE4B),
      body: Center(
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
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30.h),
                AppTitleWidget(),
                SizedBox(height: 25.h),
                Container(
                  width: 343.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white,
                  ),
                  child: Selector<LoginController, bool>(
                    selector:
                        (context, loginController) =>
                            loginController.isLoginMode,
                    builder: (context, isLoginMode, _) {
                      return SingleChildScrollView(
                        child: _buildLoginForm(context, isLoginMode),
                      );
                    },
                  ),
                ),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context, bool isLoginMode) {
    final loginController = context.watch<LoginController>();
    return Column(
      children: [
        _buildTitle(context),
        SizedBox(height: 12.h),
        _buildSwitchModeRow(context, isLoginMode, loginController),
        SizedBox(height: 24.h),
        EmailFieldWidget(loginController: loginController),
        SizedBox(height: 16.h),
        PasswordFieldWidget(
          loginController: loginController,
          title: AppLocalizations.of(context)!.self_password,
          hintText: AppLocalizations.of(context)!.password_hint,
          controller: loginController.passwordController,
          onChange:
              (value) => loginController.validateField(
                field: 'password',
                value: value,
                context: context,
              ),
          errorText: loginController.errors['password'],
          obscureText: loginController.obscureText,

          suffixIcon: IconButton(
            onPressed: () {
              loginController.togglePasswordVisibility();
            },
            icon: Icon(
              loginController.obscureText
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: Colors.grey,
              size: 20.sp,
            ),
          ),
        ),
        _rememberMeAndForgetPassword(),
        _buildSubmitButton(context, isLoginMode, loginController),
        _buildOrDivider(),
        SizedBox(height: 24.h),
        _buildOtherLoginButtons(context),
        SizedBox(height: 24.h),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Padding(
      padding: EdgeInsets.only(top: 24.sp),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          AppLocalizations.of(context)!.login_title,
          style: AppStyles.getFontStyle(
            langController,
            color: const Color(0xFF111827),
            fontWeight: FontWeight.w700,
            fontSize: 32.sp,
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchModeRow(
    BuildContext context,
    bool isLoginMode,
    LoginController loginController,
  ) {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24.sp),
          child: Text(
            AppLocalizations.of(context)!.login_subtitle,
            style: AppStyles.getFontStyle(
              langController,
              color: Color(0xFF6C7278),
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            loginController.clearErrors();
            _clearFields(loginController);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpScreen()),
            );
          },
          child: Text(
            AppLocalizations.of(context)!.signup_title,
            style: AppStyles.getFontStyle(
              langController,
              color: AppConstants.buttonColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRememberMeButton(
    BuildContext context,
    LoginController loginController,
  ) {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Selector<LoginController, bool>(
      selector: (context, loginProvider) => loginProvider.isRememberMeChecked,
      builder: (context, isRememberMeChecked, _) {
        return Padding(
          padding: EdgeInsets.only(top: 16.sp, left: 5.sp),
          child: Row(
            children: [
              SizedBox(
                height: 11.h,
                width: 11.w,
                child: Checkbox(
                  activeColor: AppConstants.buttonColor,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: isRememberMeChecked,
                  onChanged: (bool? value) async {
                    loginController.setRememberMe(value ?? false);
                    final secureStorageProvider =
                        Provider.of<SecureStorageController>(
                          context,
                          listen: false,
                        );
                    if (value == true) {
                      await secureStorageProvider.saveCredentials(
                        loginController.emailController.text,
                        loginController.passwordController.text,
                      );
                    } else {
                      await secureStorageProvider.clearCredentials();
                    }
                  },
                ),
              ),
              SizedBox(width: 10.w),
              // Title text
              GestureDetector(
                onTap: () {
                  loginController.setRememberMe(!isRememberMeChecked);
                  final secureStorageProvider =
                      Provider.of<SecureStorageController>(
                        context,
                        listen: false,
                      );
                  if (!isRememberMeChecked) {
                    secureStorageProvider.saveCredentials(
                      loginController.emailController.text,
                      loginController.passwordController.text,
                    );
                  } else {
                    secureStorageProvider.clearCredentials();
                  }
                },
                child: Text(
                  AppLocalizations.of(context)!.remember_me,
                  style: AppStyles.getFontStyle(
                    langController,
                    color: const Color(0xFF6C7278),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildForgotPasswordButton(
    BuildContext context,
    LoginController loginController,
  ) {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );

    return Padding(
      padding: EdgeInsets.only(top: 16.sp),
      child: TextButton(
        onPressed: () {
          loginController.clearErrors();
          _clearFields(loginController);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ForgetPasswordScreen()),
          );
        },
        child: Text(
          AppLocalizations.of(context)!.forget_password,
          style: AppStyles.getFontStyle(
            langController,
            color: AppConstants.buttonColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _rememberMeAndForgetPassword() {
    LoginController loginController = Provider.of<LoginController>(
      context,
      listen: false,
    );
    return Padding(
      padding: EdgeInsets.only(left: 24.sp, right: 24.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildRememberMeButton(context, loginController),
          _buildForgotPasswordButton(context, loginController),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(
    BuildContext context,
    bool isLoginMode,
    LoginController loginController,
  ) {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Padding(
      padding: EdgeInsets.only(top: 24.sp, bottom: 24.sp),
      child: Selector<LoginController, bool>(
        selector: (context, loginController) => loginController.isLoading,
        builder: (context, isLoading, _) {
          return isLoading
              ? const Center(
                child: CircularProgressIndicator(color: Color(0xFF170F4C)),
              )
              : LoginButtonWidget(
                textColor: Colors.white,
                buttonName:
                    isLoginMode
                        ? AppLocalizations.of(context)!.login_title
                        : AppLocalizations.of(context)!.register_button,
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  loginController.setLoading(true);
                  try {
                    loginController.validateEmail(
                      loginController.emailController.text,
                    );
                    loginController.validatePassword(
                      loginController.passwordController.text,
                    );
                    if (loginController.isFormValid()) {
                      final secureStorageProvider =
                          Provider.of<SecureStorageController>(
                            context,
                            listen: false,
                          );
                      if (loginController.isRememberMeChecked) {
                        await secureStorageProvider.saveCredentials(
                          loginController.emailController.text,
                          loginController.passwordController.text,
                        );
                      } else {
                        await secureStorageProvider.clearCredentials();
                      }

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen()),
                      );
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: const Color(0xFFE7F4FF),
                          content: Text(
                            AppLocalizations.of(context)!.something_went_wrong,
                            style: AppStyles.getFontStyle(
                              langController,
                              color: const Color(0xFF170F4C),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    }
                  } finally {
                    loginController.setLoading(false);
                  }
                },
              );
        },
      ),
    );
  }

  Widget _buildOtherLoginButtons(BuildContext context) {
    return Column(
      children: [
        // Google Sign-In Button
        LoginButtonWidget(
          buttonName: AppLocalizations.of(context)!.continue_with_google,
          buttonColor: Colors.white,
          textColor: Color(0xFF1A1C1E),
          widget: Image(
            image: AssetImage("assets/images/google.png"),
            height: 18.h,
            width: 18.w,
          ),
          onPressed: () {},
        ),
        SizedBox(height: 15.h),

        LoginButtonWidget(
          buttonName: AppLocalizations.of(context)!.continue_with_facebook,
          buttonColor: Colors.white,
          textColor: Color(0xFF1A1C1E),
          widget: Image(
            image: AssetImage("assets/images/facebook.png"),
            height: 18.h,
            width: 18.w,
          ),
          onPressed: () {},
        ),
        SizedBox(height: 15.h),

        // Apple Sign-In Button
        LoginButtonWidget(
          buttonName: AppLocalizations.of(context)!.continue_with_apple,
          buttonColor: Colors.white,
          textColor: Color(0xFF1A1C1E),
          widget: Image(
            image: AssetImage("assets/images/apple.png"),
            height: 18.h,
            width: 18.w,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildOrDivider() {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Padding(
      padding: EdgeInsets.only(left: 24.sp, right: 24.sp),
      child: Row(
        children: [
          Expanded(child: Divider(thickness: 1, color: Color(0xFFEDF1F3))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              AppLocalizations.of(context)!.or,
              style: AppStyles.getFontStyle(
                langController,
                color: Color(0xFF6C7278),
                fontWeight: FontWeight.w700,
                fontSize: 12.sp,
              ),
            ),
          ),
          Expanded(child: Divider(thickness: 1, color: Color(0xFFEDF1F3))),
        ],
      ),
    );
  }

  void _clearFields(LoginController loginController) {
    loginController.emailController.clear();
    loginController.passwordController.clear();
    loginController.nameController.clear();
    loginController.birthController.clear();
  }
}
