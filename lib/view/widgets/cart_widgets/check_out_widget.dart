import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../app_constants.dart';
import '../../../controller/cart_controller.dart';
import '../custom_button_widget.dart';

class CheckOutWidget extends StatelessWidget {
  VoidCallback? onPressed;
  CheckOutWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, cartController, _) {
        final subTotal = cartController.calculateSubTotal();
        const deliveryCharge = 10.0;
        const discount = 10.0;
        final total = subTotal + deliveryCharge - discount;

        return Container(
          width: 387.w,
          decoration: BoxDecoration(
            color: AppConstants.buttonColor,
            borderRadius: BorderRadius.circular(7.r),
            image: DecorationImage(
              image: AssetImage("assets/images/back.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Column(
              children: [
                _buildRow("Sub-Total", "\$$subTotal", 14.sp, FontWeight.w500),
                SizedBox(height: 6.h),
                _buildRow("Delivery Charge", "\$$deliveryCharge", 14.sp, FontWeight.w500),
                SizedBox(height: 6.h),
                _buildRow("Discount", "-\$$discount", 14.sp, FontWeight.w500),
                SizedBox(height: 6.h),
                _buildRow("Total:", "\$$total", 18.sp, FontWeight.w700),
                SizedBox(height: 28.h),
                CustomButtonWidget(
                  title: "Place My Order",
                  borderRadius: 7.r,
                  width: double.infinity,
                  height: 60.h,
                  titleColor: AppConstants.buttonColor,
                  colors: [Colors.white, Colors.white],
                  onPressed: onPressed,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRow(String label, String value, double fontSize, FontWeight fontWeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: fontSize,
            color: Colors.white,
            fontWeight: fontWeight,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: fontSize,
            color: Colors.white,
            fontWeight: fontWeight,
          ),
        ),
      ],
    );
  }
}