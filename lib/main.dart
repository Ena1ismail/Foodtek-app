import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/controller/cart_controller.dart';
import 'package:foodtek/controller/filter_controller.dart';
import 'package:foodtek/controller/home_page_controller.dart';
import 'package:foodtek/controller/location_controller.dart';
import 'package:foodtek/controller/login_controller.dart';
import 'package:foodtek/controller/secure_storage_controller.dart';
import 'package:foodtek/view/screens/main_screen.dart';
import 'package:foodtek/view/screens/onboarding_screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'controller/onboarding_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SlidesController()),
          ChangeNotifierProvider(create: (context) => LoginController()),
          ChangeNotifierProvider(create: (context) => LocationController()),
          ChangeNotifierProvider(create: (context) => SecureStorageController()),
          ChangeNotifierProvider(create: (context) => HomePageController()),
          ChangeNotifierProvider(create: (context) => FilterController()),
          ChangeNotifierProvider(create: (context) => CartController()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
