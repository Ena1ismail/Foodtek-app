import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/controller/cart_controller.dart';
import 'package:foodtek/controller/check_out_controller.dart';
import 'package:foodtek/controller/filter_controller.dart';
import 'package:foodtek/controller/home_page_controller.dart';
import 'package:foodtek/controller/location_controller.dart';
import 'package:foodtek/controller/login_controller.dart';
import 'package:foodtek/controller/secure_storage_controller.dart';
import 'package:foodtek/controller/lang_controller.dart';
import 'package:foodtek/controller/onboarding_controller.dart';
import 'package:foodtek/theme/theme_cubit.dart';
import 'package:foodtek/view/screens/home_screen.dart';
import 'package:foodtek/view/screens/main_screen.dart';
import 'package:foodtek/view/screens/onboarding_screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'l10n/app_localizations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDark = prefs.getBool('isDark') ?? false;

  runApp(
      const MyApp()
  );
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
          ChangeNotifierProvider(
              create: (context) => SecureStorageController()),
          ChangeNotifierProvider(create: (context) => HomePageController()),
          ChangeNotifierProvider(create: (context) => FilterController()),
          ChangeNotifierProvider(create: (context) => CartController()),
          ChangeNotifierProvider(create: (context) => CheckOutController()),
          ChangeNotifierProvider(create: (context) => LangController()),
        ],
        child: BlocProvider(
          create: (context) => ThemeCubit()..getTheme(),
          child: Builder(
            builder: (context) {
              final langController = Provider.of<LangController>(context);
              return BlocBuilder<ThemeCubit, ThemeData>(
                builder: (context, themeData) {
                  return MaterialApp(
                    locale: langController.locale,
                    localizationsDelegates: [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: const [Locale('en'), Locale('ar')],
                    debugShowCheckedModeBanner: false,
                    theme: themeData,
                    home: SplashScreen(),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
