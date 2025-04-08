import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/controller/cart_controller.dart';
import 'package:foodtek/model/food_item.dart';
import 'package:foodtek/view/widgets/home_widgets/counter_buttons_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final FoodItem foodItem;
  Widget? widget;
  DismissDirectionCallback? onDismissed;

  CartItemWidget({
    super.key,
    required this.foodItem,
    this.widget,
    this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, cartController, _) {
        return Column(
          children: [
            Dismissible(
              key: Key(foodItem.id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed:
                  onDismissed ?? (_) => cartController.removeItem(foodItem),
              background: _buildSwipeBackground(),
              child: _buildCartItem(context, cartController),
            ),
            SizedBox(height: 20.h),
          ],
        );
      },
    );
  }

  Widget _buildSwipeBackground() {
    return Container(
      width: 65.w,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(7.r),
      ),
      alignment: Alignment.centerRight,
      child: Icon(Icons.delete_outline, color: Colors.white, size: 36.sp),
    );
  }

  Widget _buildCartItem(BuildContext context, CartController cartController) {
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
                child: CounterButtonsWidget(
                  value: foodItem.quantity ?? 0,
                  color: const Color(0xFFEAF7ED),
                  onIncrement: () => cartController.incrementItem(foodItem),
                  onDecrement:
                      () => cartController.decrementItem(foodItem, context),
                ),
              ),

          SizedBox(width: 8.w),
        ],
      ),
    );
  }
}
