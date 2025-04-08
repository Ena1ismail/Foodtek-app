import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/controller/home_page_controller.dart';
import 'package:foodtek/model/food_item.dart';
import 'package:foodtek/view/widgets/custom_button_widget.dart';
import 'package:foodtek/view/screens/product_details_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FoodItemWidget extends StatelessWidget {
  final FoodItem foodItem;

  const FoodItemWidget({Key? key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: 177.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 240.h,
            width: 174.w,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFDBF4D1), width: 1.5.w),
              borderRadius: BorderRadius.circular(25.r),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 70.h),
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      foodItem.name!,
                      style: GoogleFonts.sora(
                        color: Color(0xFF24262F),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/Emoji.png",
                          height: 10.h,
                          width: 10.w,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 4.w),
                        Flexible(
                          child: Text(
                            foodItem.description!,
                            style: GoogleFonts.sora(
                              fontSize: 10.sp,
                              color: Color(0xFF969AB0),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Center(
                    child: Text(
                      "\$${foodItem.newPrice.toString()}",
                      style: GoogleFonts.sora(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),

          Positioned(
            top: 0,
            child: Consumer<HomePageController>(builder: (context, homePageController, child) {
              return GestureDetector(
                onTap: () {
                  homePageController.toggleProductDetails();
                  homePageController.selectedFoodItem(foodItem);
                },
                child: SizedBox(
                  height: 89.h,
                  width: 89.w,
                  child: CircleAvatar(
                    backgroundColor: Color(0xFFE7E7E7),
                    child: Image.asset(
                      foodItem.imageUrl!,
                      height: 75.h,
                      width: 75.w,
                    ),
                  ),
                ),
              );
            },),
          ),

          Consumer<HomePageController>(
            builder: (context, homePageController, child) {
              return Positioned(
                right: 0,
                top: 20,
                child: Container(
                  height: 36.h,
                  width: 36.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                    color: Color(0xFFDBF4D1),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        homePageController.toggleFavourite(context, foodItem);
                      },
                      icon:
                          homePageController.isFavourite(foodItem)
                              ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 17.w,
                              )
                              : Icon(
                                Icons.favorite_border,
                                color: Color(0xFF222628),
                                size: 17.w,
                              ),
                    ),
                  ),
                ),
              );
            },
          ),

          Consumer<HomePageController>(
            builder: (context, homePageController, child) {
              return Positioned(
                bottom: 25,
                left: 40,
                right: 40,
                child: CustomButtonWidget(
                  width: 95.w,
                  height: 35.h,
                  title: "Order now",
                  colors: [AppConstants.buttonColor, AppConstants.buttonColor],
                  borderRadius: 25.r,
                  style: GoogleFonts.sora(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  onPressed: () {
                    homePageController.toggleProductDetails();
                    homePageController.selectedFoodItem(foodItem);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
