import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/model/food_item.dart';
import 'package:google_fonts/google_fonts.dart';

class TopRatedWidget extends StatelessWidget {
  final FoodItem foodItem;

  const TopRatedWidget({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      width: 175.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Color(0xFFDBF4D1), width: 1.5.w),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRatingRow(),
            SizedBox(height: 8.h),
            _buildImage(),
            SizedBox(height: 8.h),
            _buildName(),
            SizedBox(height: 4.h),
            _buildIngredients(),
            Spacer(),
            _buildPriceAndButton(),
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

  Widget _buildImage() {
    return Center(
      child: Image.asset(foodItem.imageUrl!, height: 70.h, width: 87.w, fit: BoxFit.contain),
    );
  }

  Widget _buildName() {
    return Text(
      foodItem.name!,
      style: GoogleFonts.inter(fontSize: 18.sp, fontWeight: FontWeight.w600),
    );
  }

  Widget _buildIngredients() {
    return Text(
      foodItem.ingredients!,
      style: GoogleFonts.inter(
        fontSize: 11.sp,
        fontWeight: FontWeight.w400,
        color: Color(0xFF3B3B3B),
      ),
    );
  }

  Widget _buildPriceAndButton() {
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
        _buildAddButton(),
      ],
    );
  }

  Widget _buildAddButton() {
    return SizedBox(
      height: 40.h,
      width: 40.w,
      child: IconButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppConstants.buttonColor),
        ),
        onPressed: () {},
        icon: Icon(Icons.add, color: Colors.white, size: 22.r),
      ),
    );
  }
}
