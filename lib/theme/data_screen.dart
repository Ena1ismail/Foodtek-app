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
                  return Row(
                    children: [
                      Switch(
                        value: context.read<ThemeCubit>().isDark,
                        onChanged: (value) {
                          context.read<ThemeCubit>().changeTheme();
                        },
                      ), // Switch
                      Text("is Dark"),
                    ],
                  ); // Row
                },
              ), // BlocBuilder
              SizedBox(height: 10),
              Text("bodyLarge", style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: 10),
              Text("bodyMedium", style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 10),
              Text("bodySmall", style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: 10),
              Text("labelLarge", style: Theme.of(context).textTheme.labelLarge),
            ],
          ), // Column
        ), // SingleChildScrollView
      ), // Center
    ); // Scaffold
  }
}
