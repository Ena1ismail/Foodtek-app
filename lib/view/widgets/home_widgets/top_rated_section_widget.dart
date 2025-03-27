import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../controller/home_page_controller.dart';

class TopRatedSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homePageController = Provider.of<HomePageController>(context, listen: false);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Top Rated",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 250.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: homePageController.topRatedItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: homePageController.topRatedItems[index],
              );
            },
          ),
        ),
      ],
    );
  }
}