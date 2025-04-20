import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/theme/shared_prefences_helper.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(ThemeData());

  bool isDark = false;

  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 22),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 20),
      bodySmall: TextStyle(color: Colors.white, fontSize: 15),
      labelLarge: TextStyle(color: Colors.white, fontSize: 25),
    ),
  );

  ThemeData light = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 22),
      bodyMedium: TextStyle(color: Colors.black, fontSize: 20),
      bodySmall: TextStyle(color: Colors.black, fontSize: 15),
      labelLarge: TextStyle(color: Colors.black, fontSize: 25),
    ),
  );

  changeTheme() {
    isDark = !isDark;
    SharedPreferencesHelper().savePrefBool(
      key: AppConstants.isDark,
      value: isDark,
    );
    emit(isDark ? dark : light);
  }

  getTheme() async {
    bool isDark = await SharedPreferencesHelper().getPrefBool(
      key: AppConstants.isDark,
      defaultValue: false,
    );
    emit(isDark ? dark : light);
  }
}
