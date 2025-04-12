import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/controller/cart_controller.dart';
import 'package:foodtek/view/screens/cart_screens/check_out_successfully_screen.dart';
import 'package:foodtek/view/widgets/custom_button_widget.dart';
import 'package:foodtek/view/widgets/input_widget.dart';
import 'package:foodtek/view/widgets/main_widgets/notification_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: const [NotificationButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 33.0),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(),
              SizedBox(height: 20.h),
              _buildCardImage(),
              SizedBox(height: 8.h),
              Consumer<CartController>(
                builder: (context, cartController, child) {
                  return _buildInputField(
                    label: "Name",
                    hintText: "Enter Name",
                    controller: cartController.nameController,
                  );
                },
              ),
              SizedBox(height: 20.h),
              Consumer<CartController>(
                builder: (context, cartController, child) {
                  return _buildInputField(
                    label: "Card Number",
                    hintText: "Enter Card Number",
                    controller: cartController.cardNumberController,
                    suffixIcon: Image.asset(
                      "assets/images/cards.png",
                      height: 30.h,
                      width: 30.w,
                    ),
                    keyboardType: TextInputType.number,
                  );
                },
              ),
              SizedBox(height: 20.h),
              Consumer<CartController>(
                builder: (context, cartController, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildExpiryField(cartController.expiryController),
                      _buildCvcField(cartController.cvcController),
                    ],
                  );
                },
              ),
              SizedBox(height: 21.h),
              _buildOrderDetailsText(),
              SizedBox(height: 20.h),
              _buildPayButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      "Add Card",
      style: GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }

  Widget _buildCardImage() {
    return Image.asset("assets/images/card.png", height: 222.h);
  }

  Widget _buildInputField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    Widget? suffixIcon,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12.sp,
            color: const Color(0xFF6C7278),
            fontWeight: FontWeight.w500,
          ),
        ),
        InputWidget(
          textEditingController: controller,
          obscureText: false,
          backgroundColor: Colors.white,
          borderColor: const Color(0xFFEDF1F3),
          borderRadius: BorderRadius.circular(10.r),
          hintText: hintText,
          width: double.infinity,
          suffixIcon: suffixIcon,
          keyboardType: keyboardType,
          onChanged: (value) {},
        ),
      ],
    );
  }

  Widget _buildExpiryField(TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Expiry",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12.sp,
            color: const Color(0xFF6C7278),
            fontWeight: FontWeight.w500,
          ),
        ),
        InputWidget(
          textEditingController: controller,
          obscureText: false,
          backgroundColor: Colors.white,
          borderColor: const Color(0xFFEDF1F3),
          borderRadius: BorderRadius.circular(10.r),
          hintText: "00/00",
          width: 175.w,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  Widget _buildCvcField(TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "CVC",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 12.sp,
            color: const Color(0xFF6C7278),
            fontWeight: FontWeight.w500,
          ),
        ),
        InputWidget(
          textEditingController: controller,
          obscureText: false,
          backgroundColor: Colors.white,
          borderColor: const Color(0xFFEDF1F3),
          borderRadius: BorderRadius.circular(10.r),
          hintText: "000",
          width: 175.w,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }

  Widget _buildOrderDetailsText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Text(
        "We will send you an order details to your email after the successful payment",
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          color: const Color(0xFF929DA9),
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildPayButton(BuildContext context) {
    return Center(
      child: Consumer<CartController>(builder: (context, cartController, child) {
        return CustomButtonWidget(
          title: "Pay for the order",
          colors: [AppConstants.buttonColor, AppConstants.buttonColor],
          titleColor: Colors.white,
          borderRadius: 16.r,
          width: 330.w,
          height: 60.h,
          onPressed: () {
            if(cartController.nameController.text.isEmpty || cartController.cardNumberController.text.isEmpty || cartController.cvcController.text.isEmpty || cartController.expiryController.text.isEmpty){
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  backgroundColor: Colors.white,
                  content: Text(
                    "Please fill in all the fields",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  actions: [
                    CustomButtonWidget(
                      title: "Ok",
                      colors: [
                        AppConstants.buttonColor,
                        AppConstants.buttonColor,
                      ],
                      height: 60.h,
                      borderRadius: 12.r,
                      titleColor: Colors.white,
                      width: 300.w,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },);
            }else {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOutSuccessfullyScreen(),));
            }
          },
        );
      },)
    );
  }
}
