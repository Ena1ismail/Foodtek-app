import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/app_styles.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constant_value.dart';
import 'shared_prefences_helper.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(ThemeData());

  bool isDark = false;

  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFF1E1E1E),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1E1E1E),
    ),

    appBarTheme: AppBarTheme(backgroundColor: Color(0xFF1E1E1E)),
    iconTheme: IconThemeData(color: Colors.black),
    primaryColor: Colors.white,
    cardColor: Color(0xFF3b3b3b),
  );

  ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.white),
    primaryColor: Colors.black,
    cardColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppConstants.buttonColor,
    ),
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
  );

  changeTheme() {
    isDark = !isDark;
    SharedPreferencesHelper().savePrefBool(
      key: ConstValue.isDark,
      value: isDark,
    );
    emit(isDark ? dark : light);
  }

  getTheme() async {
    bool isDark = await SharedPreferencesHelper().getPrefBool(
      key: ConstValue.isDark,
      defaultValue: false,
    );
    emit(isDark ? dark : light);
  }
}
