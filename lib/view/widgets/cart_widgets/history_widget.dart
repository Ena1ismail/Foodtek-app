import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/controller/cart_controller.dart';
import 'package:foodtek/model/food_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../app_constants.dart';
import 'cart_item_widget.dart';

class HistoryWidget extends StatelessWidget {
  FoodItem foodItem;

  HistoryWidget({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, cartController, child) {
        return CartItemWidget(
          foodItem: foodItem,
          isDismissible: false,
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.access_time, color: AppConstants.buttonColor),
                  SizedBox(width: 5.w),
                  Text(
                    "25/3/2025",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: Color(0xFF3B3B3B),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.history_outlined, color: AppConstants.buttonColor),
                  Consumer<CartController>(
                    builder: (context, cartController, child) {
                      return TextButton(
                        onPressed: () {
                          cartController.addItem(foodItem);
                        },
                        child: Text(
                          "Reorder",
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: AppConstants.buttonColor,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
