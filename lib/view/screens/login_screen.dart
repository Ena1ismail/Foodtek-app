import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/controller/login_controller.dart';
import 'package:foodtek/view/screens/forget_password_screen.dart';
import 'package:foodtek/view/screens/sign_up_screen.dart';
import 'package:foodtek/view/widgets/app_title_widget.dart';
import 'package:foodtek/view/widgets/email_field_widget.dart';
import 'package:foodtek/view/widgets/login_button_widget.dart';
import 'package:foodtek/view/widgets/password_field_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller/secure_storage_controller.dart';

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
                SizedBox(height: 24.h,)
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
          title: "Password",
          hintText: "Enter your password",
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
        SizedBox(height: 24.h,)
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.sp),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          "Login",
          style: GoogleFonts.inter(
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24.sp),
          child: Text(
            "Don’t have an account?",
            style: GoogleFonts.inter(
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
            "Sign Up",
            style: GoogleFonts.inter(
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
                  "Remember me",
                  style: GoogleFonts.inter(
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
          "Forget Password ?",
          style: GoogleFonts.inter(
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
                buttonName: isLoginMode ? "Log In" : "Register",
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  loginController.setLoading(true);
                  try {
                    loginController.validateForm(
                      email: loginController.emailController.text,
                      password: loginController.passwordController.text,
                      name:
                          isLoginMode
                              ? null
                              : loginController.nameController.text,
                      context: context,
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
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: const Color(0xFFE7F4FF),
                          content: Text(
                            "Something Went wrong",
                            style: GoogleFonts.inter(
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
          buttonName: "Continue with Google",
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
          buttonName: "Continue with Facebook",
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
          buttonName: "Continue with Apple",
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
    return Padding(
      padding: EdgeInsets.only(left: 24.sp, right: 24.sp),
      child: Row(
        children: [
          Expanded(child: Divider(thickness: 1, color: Color(0xFFEDF1F3))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Or',
              style: GoogleFonts.inter(
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
