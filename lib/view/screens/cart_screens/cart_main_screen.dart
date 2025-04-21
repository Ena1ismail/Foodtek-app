import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/view/screens/history_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../app_styles.dart';
import '../../../controller/lang_controller.dart';
import '../../../l10n/app_localizations.dart';
import 'cart_screen.dart';

class CartMainScreen extends StatelessWidget {
  const CartMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: TabBar(
            tabs: [
              Tab(text: AppLocalizations.of(context)!.cart),
              Tab(text: AppLocalizations.of(context)!.history),
            ],
            labelColor: AppConstants.buttonColor,
            unselectedLabelColor: Color(0xFF98A0B4),
            indicatorColor: AppConstants.buttonColor,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: AppStyles.getFontStyle(
              langController,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: AppStyles.getFontStyle(
              langController,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: TabBarView(children: [CartScreen(), HistoryScreen()]),
      ),
    );
  }
}
