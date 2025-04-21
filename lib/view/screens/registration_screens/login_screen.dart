import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:foodtek/controller/login_controller.dart';
import 'package:foodtek/controller/lang_controller.dart';
import 'package:foodtek/controller/secure_storage_controller.dart';
import 'package:foodtek/view/widgets/registration_widgets/email_field_widget.dart';
import 'package:foodtek/view/widgets/registration_widgets/password_field_widget.dart';
import 'package:foodtek/view/widgets/registration_widgets/login_button_widget.dart';
import 'package:foodtek/l10n/app_localizations.dart';
import 'package:foodtek/app_styles.dart';
import 'package:foodtek/view/screens/registration_screens/sign_up_screen.dart';
import 'package:foodtek/view/screens/home_screen.dart';

import '../../../app_constants.dart';
import '../../widgets/onboarding_widgets/app_title_widget.dart';
import '../main_screen.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDarkMode ? Color(0xFF1E1E1E): Color(0xFF25AE4B),
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
                    color: Theme.of(context).scaffoldBackgroundColor,
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
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final langController = Provider.of<LangController>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(top: 24.sp),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          AppLocalizations.of(context)!.login_title,
          style: AppStyles.getFontStyle(
            langController,
            color: isDarkMode ? Colors.white : Color(0xFF111827),
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
    final langController = Provider.of<LangController>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24.sp),
          child: Text(
            AppLocalizations.of(context)!.login_subtitle,
            style: AppStyles.getFontStyle(
              langController,
              color: const Color(0xFF6C7278),
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        Flexible(
          child: TextButton(
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
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ),
      ],
    );
  }

  Widget _rememberMeAndForgetPassword() {
    final loginController = Provider.of<LoginController>(
      context,
      listen: false,
    );

    return Padding(
      padding: EdgeInsets.only(left: 24.sp, right: 24.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRememberMeButton(context, loginController),
          _buildForgotPasswordButton(context, loginController),
        ],
      ),
    );
  }

  Widget _buildRememberMeButton(
    BuildContext context,
    LoginController loginController,
  ) {
    final langController = Provider.of<LangController>(context, listen: false);

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
              GestureDetector(
                onTap: () {
                  loginController.setRememberMe(!isRememberMeChecked);
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
    final langController = Provider.of<LangController>(context, listen: false);

    return TextButton(
      onPressed: () {
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
    );
  }

  Widget _buildSubmitButton(
    BuildContext context,
    bool isLoginMode,
    LoginController loginController,
  ) {
    final langController = Provider.of<LangController>(context, listen: false);

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
                textColor: Theme.of(context).scaffoldBackgroundColor,
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
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen()),
                        (route) => false,
                      );
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
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

  Widget _buildOrDivider() {
    final langController = Provider.of<LangController>(context, listen: false);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.sp),
      child: Row(
        children: [
          Expanded(child: Divider(thickness: 1, color: Color(0xFFEDF1F3))),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.sp),
            child: Text(
              AppLocalizations.of(context)!.or,
              style: AppStyles.getFontStyle(
                langController,
                color: const Color(0xFF6C7278),
                fontWeight: FontWeight.w700,
                fontSize: 12.sp,
              ),
            ),
          ),
          Expanded(
            child: Divider(thickness: 1, color: const Color(0xFFEDF1F3)),
          ),
        ],
      ),
    );
  }

  Widget _buildOtherLoginButtons(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Column(
      children: [
        LoginButtonWidget(
          buttonName: AppLocalizations.of(context)!.continue_with_google,
          buttonColor: Theme.of(context).scaffoldBackgroundColor,
          textColor: isDarkMode? Colors.white: Color(0xFF1A1C1E),
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
          buttonColor: Theme.of(context).scaffoldBackgroundColor,
          textColor: isDarkMode? Colors.white: Color(0xFF1A1C1E),
          widget: Image(
            image: AssetImage("assets/images/facebook.png"),
            height: 18.h,
            width: 18.w,
          ),
          onPressed: () {},
        ),
        SizedBox(height: 15.h),
        LoginButtonWidget(
          buttonName: AppLocalizations.of(context)!.continue_with_apple,
          buttonColor: Theme.of(context).scaffoldBackgroundColor,
          textColor: isDarkMode? Colors.white: Color(0xFF1A1C1E),
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

  void _clearFields(LoginController loginController) {
    loginController.emailController.clear();
    loginController.passwordController.clear();
    loginController.nameController.clear();
    loginController.birthController.clear();
  }
}
