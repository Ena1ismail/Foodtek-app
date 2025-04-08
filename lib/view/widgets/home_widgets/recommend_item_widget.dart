import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/controller/home_page_controller.dart';
import 'package:foodtek/model/food_item.dart';
import 'package:provider/provider.dart';

class RecommendItemWidget extends StatelessWidget {
  FoodItem foodItem;

  RecommendItemWidget({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageController>(builder: (context, homePageController, child) {
      return GestureDetector(
        onTap: () {
          homePageController.toggleProductDetails();
          homePageController.selectedFoodItem(foodItem);
        },
        child: Stack(
          children: [
            Image.asset(
              foodItem.imageUrl!,
              fit: BoxFit.fill,
              height: 108.h,
              width: 72.w,
            ),
            Positioned(
              right: 0,
              bottom: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: AppConstants.buttonColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 4),
                  child: Text(
                    "\$${foodItem.newPrice}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },);
  }
}
