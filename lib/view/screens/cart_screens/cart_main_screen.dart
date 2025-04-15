import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/view/screens/history_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../l10n/app_localizations.dart';
import 'cart_screen.dart';

class CartMainScreen extends StatelessWidget {
  const CartMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: TabBar(
            tabs: [Tab(text: AppLocalizations.of(context)!.cart), Tab(text:AppLocalizations.of(context)!. history)],
            labelColor: AppConstants.buttonColor,
            unselectedLabelColor: Color(0xFF98A0B4),
            indicatorColor: AppConstants.buttonColor,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: GoogleFonts.inter(
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
