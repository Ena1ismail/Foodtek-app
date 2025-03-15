import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../app_constants.dart';
import '../../controller/onboarding_controller.dart';

class SlidesScreen extends StatelessWidget {
  const SlidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingController = Provider.of<SlidesController>(context);


    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: onboardingController.pageController,
            itemCount: onboardingController.slides.length,
            onPageChanged: (index) {
              onboardingController.currentPage = index;
            },
            itemBuilder: (context, index) {
              return onboardingController.slides[index];
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 90.h,
              width: 321.w,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      onboardingController.skip(context);
                    },
                    child: Text(
                      "Skip",
                      style: GoogleFonts.poppins(
                        color:  AppConstants.primaryTextColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: onboardingController.pageController,
                    count: onboardingController.slides.length,
                    axisDirection: Axis.horizontal,
                    effect: JumpingDotEffect(
                      spacing: 8.0,
                      radius: 4.0,
                      dotWidth: 10.0.w,
                      dotHeight: 10.0.h,
                      dotColor: const Color(0xFFE6E6E6),
                      activeDotColor: AppConstants.buttonColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      onboardingController.navigateToNext(context);
                    },
                    icon: const Icon(Icons.arrow_forward),
                    color: AppConstants.buttonColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
