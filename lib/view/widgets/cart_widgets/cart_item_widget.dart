import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/controller/cart_controller.dart';
import 'package:foodtek/model/food_item.dart';
import 'package:foodtek/view/widgets/home_widgets/counter_buttons_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../custom_button_widget.dart';

class CartItemWidget extends StatelessWidget {
  final FoodItem foodItem;
  final Widget? widget;
  final bool isDismissible;

  const CartItemWidget({
    super.key,
    required this.foodItem,
    this.widget,
    this.isDismissible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, cartController, child) {
        return Column(
          children: [
            _buildCartItem(context, cartController),
            SizedBox(height: 20.h),
          ],
        );
      },
    );
  }

  Widget _buildCartItem(BuildContext context, CartController cartController) {
    if (isDismissible) {
      return Slidable(
        key: Key(foodItem.id.toString()),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) async {
                final shouldDelete = await showDialog<bool>(
                  context: context,
                  builder:
                      (context) => AlertDialog(
                        backgroundColor: Colors.white,
                        content: Text(
                          textAlign: TextAlign.center,
                          "Are you sure you want to remove it from Carts?",
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        actions: [
                          CustomButtonWidget(
                            title: "Yes",
                            colors: [
                              AppConstants.buttonColor,
                              AppConstants.buttonColor,
                            ],
                            height: 60.h,
                            borderRadius: 12.r,
                            titleColor: Colors.white,
                            width: 300.w,
                            onPressed: () {
                              cartController.removeItem(foodItem);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                );
                if (shouldDelete == true) {
                  cartController.removeItem(foodItem);
                }
              },
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              icon: Icons.delete_outline,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(7.r),
                bottomRight: Radius.circular(7.r),
              ),
            ),
          ],
        ),
        child: _buildCartItemContent(),
      );
    } else {
      return _buildCartItemContent();
    }
  }

  Widget _buildCartItemContent() {
    return Container(
      height: 110.h,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFDBF4D1), width: 1.w),
        borderRadius: BorderRadius.circular(7.r),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7.r),
              child: Image.asset(
                foodItem.imageUrl ?? "assets/images/default.png",
                height: 65.h,
                width: 65.w,
                fit: BoxFit.contain,
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodItem.name ?? "Unknown Product",
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    foodItem.category ?? "Unknown Category",
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: const Color(0xFF3B3B3B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "\$${foodItem.newPrice?.toStringAsFixed(1) ?? "0.0"}",
                    style: GoogleFonts.inter(
                      fontSize: 19.sp,
                      color: AppConstants.buttonColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          widget ??
              SizedBox(
                width: 120.w,
                child: Consumer<CartController>(
                  builder: (context, cartController, child) {
                    return CounterButtonsWidget(
                      value: foodItem.quantity ?? 0,
                      color: const Color(0xFFEAF7ED),
                      onIncrement: () => cartController.incrementItem(foodItem),
                      onDecrement:
                          () => cartController.decrementItem(foodItem, context),
                    );
                  },
                ),
              ),

          SizedBox(width: 8.w),
        ],
      ),
    );
  }
}
