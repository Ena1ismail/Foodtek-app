import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/view/widgets/input_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = false;

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Foodtek',
                style: GoogleFonts.protestRiot(
                  color: Colors.white,
                  fontSize: 80.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 42.h),
              Container(
                width: 343.w,
                height: 661.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 24.h),
                      Text(
                        "Login",
                        style: GoogleFonts.inter(
                          color: Color(0xFF111827),
                          fontWeight: FontWeight.w700,
                          fontSize: 32.sp,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account?",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: 12.sp,
                              color: Color(0xFF6C7278),
                            ),
                          ),
                          SizedBox(width: 6.w),
                          TextButton(
                            onPressed: () {},
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
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Email",
                                style: GoogleFonts.plusJakartaSans(
                                  color: Color(0xFF6C7278),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          InputWidget(
                            textEditingController: _emailController,
                            obscureText: false,
                            backgroundColor: Colors.white,
                            borderColor: Color(0xFFEDF1F3),
                          ),
                          SizedBox(height: 16.h),
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Password",
                                style: GoogleFonts.plusJakartaSans(
                                  color: Color(0xFF6C7278),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          InputWidget(
                            textEditingController: _passwordController,
                            obscureText: _obscurePassword,
                            // Use state for visibility
                            backgroundColor: Colors.white,
                            borderColor: Color(0xFFEDF1F3),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obscurePassword =
                                      !_obscurePassword; // Toggle visibility
                                });
                              },
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Color(0xFFACB5BB),
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Checkbox for "Remember Me"
                              Row(
                                children: [
                                  Checkbox(
                                    value: _rememberMe,
                                    onChanged: (value) {
                                      setState(() {
                                        _rememberMe = value ?? false;
                                      });
                                    },
                                    activeColor: AppConstants.buttonColor,
                                  ),
                                  Text(
                                    "Remember Me",
                                    style: GoogleFonts.inter(
                                      color: Color(0xFF6C7278),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ],
                              ),
                              // Forgot Password Button
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Forget Password?",
                                  style: GoogleFonts.inter(
                                    color: AppConstants.buttonColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24.h),
                          SizedBox(
                            width: 295.w,
                            height: 48.h,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all<Color>(
                                  AppConstants.buttonColor,
                                ),
                              ),
                              onPressed: () {
                                // Perform login logic here
                                final email = _emailController.text;
                                final password = _passwordController.text;
                                print("Email: $email, Password: $password");
                                print("Remember Me: $_rememberMe");
                              },
                              child: Text(
                                "Login",
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
