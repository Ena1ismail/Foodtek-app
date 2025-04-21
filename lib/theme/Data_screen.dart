import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/theme/theme_cubit.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<ThemeCubit, ThemeData>(
                builder: (context, themeData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Change Theme Color",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      Switch(
                        value: context.read<ThemeCubit>().isDark,
                        onChanged: (value) {
                          context.read<ThemeCubit>().changeTheme();
                        },
                      ), // Switch
                    ],
                  ); // Row
                },
              ),
              SizedBox(height: 10),
            ],
          ), // Column
        ), // SingleChildScrollView
      ), // Center
    ); // Scaffold
  }
}
