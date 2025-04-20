import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../app_styles.dart';
import '../../../controller/home_page_controller.dart';
import '../../../controller/lang_controller.dart';
import '../../../l10n/app_localizations.dart';
import 'recommend_item_widget.dart';

class RecommendedSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    final homePageController = Provider.of<HomePageController>(
      context,
      listen: false,
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.recommend,
                style: AppStyles.getFontStyle(
                  langController,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  AppLocalizations.of(context)!.view_all,
                  style: AppStyles.getFontStyle(
                    langController,
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
          height: calculateHeight(context),
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

  double calculateHeight(BuildContext context) {
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    if (textScaleFactor <= 1.3) {
      return MediaQuery.of(context).size.height * 0.12;
    } else {
      return MediaQuery.of(context).size.height * 0.20;
    }
  }
}
