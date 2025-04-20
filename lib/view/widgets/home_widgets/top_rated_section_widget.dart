import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../app_styles.dart';
import '../../../controller/home_page_controller.dart';
import '../../../controller/lang_controller.dart';
import '../../../l10n/app_localizations.dart';

class TopRatedSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LangController langController =
    Provider.of<LangController>(context, listen: false);
    final homePageController = Provider.of<HomePageController>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            AppLocalizations.of(context)!.top_rated,
            style: AppStyles.getFontStyle( langController,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: calculateHeight(context),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 25),
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

  double calculateHeight(BuildContext context) {
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    if (textScaleFactor <= 1.3) {
      return MediaQuery.of(context).size.height * 0.27;
    } else {
      return MediaQuery.of(context).size.height * 0.47;
    }
  }
}