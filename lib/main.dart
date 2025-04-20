import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/controller/cart_controller.dart';
import 'package:foodtek/controller/check_out_controller.dart';
import 'package:foodtek/controller/filter_controller.dart';
import 'package:foodtek/controller/home_page_controller.dart';
import 'package:foodtek/controller/location_controller.dart';
import 'package:foodtek/controller/login_controller.dart';
import 'package:foodtek/controller/secure_storage_controller.dart';
import 'package:foodtek/theme/theme_provider.dart';
import 'package:foodtek/view/screens/onboarding_screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'controller/lang_controller.dart';
import 'controller/onboarding_controller.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';


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
          ChangeNotifierProvider(create: (context) => CheckOutController()),
          ChangeNotifierProvider(create: (context) => LangController()),
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ],
        child: Consumer2<LangController, ThemeProvider>(
          builder: (context, langController, themeProvider, child) {
            return MaterialApp(
              locale: langController.locale,
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [Locale('en'), Locale('ar')],
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              themeMode: themeProvider.themeMode,
              home: SplashScreen(),
            );
          },
        ),
      ),
    );
  }
}
