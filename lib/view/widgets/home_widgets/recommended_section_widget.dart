import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../controller/home_page_controller.dart';
import 'recommend_item_widget.dart';

class RecommendedSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homePageController = Provider.of<HomePageController>(context, listen: false);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommend",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View All >",
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          height: 110.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: homePageController.recommendedItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 25.r),
                child: homePageController.recommendedItems[index],
              );
            },
          ),
        ),
      ],
    );
  }
}