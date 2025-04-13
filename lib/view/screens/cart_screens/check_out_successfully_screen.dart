import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/view/screens/home_screen.dart';
import 'package:foodtek/view/screens/main_screen.dart';
import 'package:foodtek/view/widgets/custom_button_widget.dart';
import 'package:foodtek/view/widgets/main_widgets/notification_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/main_widgets/notification_widget.dart';

class CheckOutSuccessfullyScreen extends StatelessWidget {
  const CheckOutSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [NotificationButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Checkout",
              style: GoogleFonts.inter(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 100.h),
            Center(
              child: Image.asset("assets/images/group2.png", height: 290.h),
            ),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                "Your Order Done Successfully",
                style: GoogleFonts.inter(
                  fontSize: 24.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                "you will get your order within 12min. thanks for using our services",
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF263238),
                ),
              ),
            ),
            SizedBox(height: 45.h),
            Center(
              child: CustomButtonWidget(
                title: "track Your Order",
                colors: [AppConstants.buttonColor, AppConstants.buttonColor],
                titleColor: Colors.white,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                        (route) => false,
                  );
                },
                borderRadius: 16.r,
                height: 60.h,
                width: 330.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
