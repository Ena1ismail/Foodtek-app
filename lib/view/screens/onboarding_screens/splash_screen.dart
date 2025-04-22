import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/controller/secure_storage_controller.dart';
import 'package:foodtek/theme/theme_cubit.dart';
import 'package:foodtek/view/screens/onboarding_screens/slides_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../controller/login_controller.dart';
import '../../../controller/lang_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      final themeCubit = context.read<ThemeCubit>();
      await themeCubit.getTheme();

      final langController = context.read<LangController>();
      await langController.initSharedPreferences();

      final secureStorageProvider = context.read<SecureStorageController>();
      final credentials = await secureStorageProvider.loadCredentials();

      final loginController = context.read<LoginController>();
      loginController.initializeCredentials(
        credentials['email'],
        credentials['password'],
      );

      loginController.setRememberMe(credentials['email'] != null);

      if (mounted) {
        setState(() {
          _isInitialized = true;
        });

        Timer(const Duration(seconds: 5), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => SlidesScreen()),
          );
        });
      }
    } catch (e) {
      print('Error during initialization: $e');

      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // if (!_isInitialized) {
    //   return Scaffold(
    //     backgroundColor: AppConstants.buttonColor,
    //     body: Center(
    //       child: CircularProgressIndicator(
    //         color: Colors.white,
    //       ),
    //     ),
    //   );
    // }

    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : const Color(0xFF25AE4B),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            'Foodtek',
            style: GoogleFonts.protestRiot(
              color: isDarkMode ? AppConstants.buttonColor : Colors.white,
              fontSize: 80.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
