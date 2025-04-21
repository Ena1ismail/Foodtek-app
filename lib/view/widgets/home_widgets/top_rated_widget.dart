import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/controller/home_page_controller.dart';
import 'package:foodtek/model/food_item.dart';
import 'package:foodtek/view/screens/product_details_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../app_styles.dart';
import '../../../controller/cart_controller.dart';
import '../../../controller/lang_controller.dart';

class TopRatedWidget extends StatelessWidget {
  final FoodItem foodItem;

  const TopRatedWidget({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Container(
      height: 240.h,
      width: 175.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: isDarkMode ? Colors.grey : Color(0xFFDBF4D1),
          width: 1.5.w,
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRatingRow(),
            SizedBox(height: 8.h),
            _buildImage(context),
            SizedBox(height: 8.h),
            _buildName(context),
            SizedBox(height: 4.h),
            _buildDescription(context),
            Spacer(),
            _buildPriceAndButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/star.png", height: 16.h, width: 16.w),
        SizedBox(width: 5.w),
        Text(
          foodItem.rating.toString(),
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: AppConstants.buttonColor,
          ),
        ),
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    return Consumer<HomePageController>(
      builder: (context, homePageController, child) {
        return GestureDetector(
          onTap: () {
            homePageController.toggleProductDetails();
            homePageController.selectedFoodItem(foodItem);
          },
          child: Center(
            child: Image.asset(
              foodItem.imageUrl!,
              height: 70.h,
              width: 87.w,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }

  Widget _buildName(BuildContext context) {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Text(
      foodItem.name!,
      style: AppStyles.getFontStyle(
        langController,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).primaryColor
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Text(
      foodItem.description!,
      style: AppStyles.getFontStyle(
        langController,
        fontSize: 11.sp,
        fontWeight: FontWeight.w400,
        color:isDarkMode? Colors.grey: Color(0xFF3B3B3B),
      ),
    );
  }

  Widget _buildPriceAndButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "\$${foodItem.newPrice.toString()}",
          style: GoogleFonts.dmSans(
            color: AppConstants.buttonColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        _buildAddButton(context),
      ],
    );
  }

  Widget _buildAddButton(BuildContext context) {
    final cartController = Provider.of<CartController>(context, listen: false);

    return SizedBox(
      height: 40.h,
      width: 40.w,
      child: IconButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppConstants.buttonColor),
        ),
        onPressed: () {
          cartController.addItem(foodItem);
        },
        icon: Icon(Icons.add, color: Colors.white, size: 22.r),
      ),
    );
  }
}
