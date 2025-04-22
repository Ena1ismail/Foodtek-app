import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/theme/shared_prefences_helper.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Controllers
import 'controller/cart_controller.dart';
import 'controller/check_out_controller.dart';
import 'controller/filter_controller.dart';
import 'controller/home_page_controller.dart';
import 'controller/location_controller.dart';
import 'controller/login_controller.dart';
import 'controller/secure_storage_controller.dart';
import 'controller/lang_controller.dart';
import 'controller/onboarding_controller.dart';

// Theme
import 'theme/theme_cubit.dart';

// Screens
import 'view/screens/onboarding_screens/splash_screen.dart';

// Localization
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final langController = LangController();
  await langController.initSharedPreferences();
  await SharedPreferencesHelper().init();

  runApp(
    ChangeNotifierProvider(
      create: (_) => langController,
      child: MyApp(),
    ),
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
          ChangeNotifierProvider(create: (_) => SlidesController()),
          ChangeNotifierProvider(create: (_) => LoginController()),
          ChangeNotifierProvider(create: (_) => LocationController()),
          ChangeNotifierProvider(create: (_) => SecureStorageController()),
          ChangeNotifierProvider(create: (_) => HomePageController()),
          ChangeNotifierProvider(create: (_) => FilterController()),
          ChangeNotifierProvider(create: (_) => CartController()),
          ChangeNotifierProvider(create: (_) => CheckOutController()),
        ],
        child: BlocProvider(
          create: (_) => ThemeCubit()..getTheme(),
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
                    supportedLocales: const [
                      Locale('en'),
                      Locale('ar'),
                    ],
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