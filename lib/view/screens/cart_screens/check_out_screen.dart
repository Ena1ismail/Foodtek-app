import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/controller/location_controller.dart';
import 'package:foodtek/view/screens/cart_screens/add_card_screen.dart';
import 'package:foodtek/view/screens/cart_screens/check_out_successfully_screen.dart';
import 'package:foodtek/view/widgets/cart_widgets/check_out_widget.dart';
import 'package:foodtek/view/widgets/input_widget.dart';
import 'package:foodtek/view/widgets/main_widgets/notification_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final TextEditingController _promoController = TextEditingController();
  String _selectedPaymentMethod = 'Card';
  String _selectedCardMethod = 'Visa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [NotificationButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildText("Checkout", 20, FontWeight.w600, Colors.black),
              SizedBox(height: 18.h),

              _buildText("Location", 18, FontWeight.w600, Colors.black),
              SizedBox(height: 12.h),
              Consumer<LocationController>(
                builder: (context, locationController, child) {
                  // Get the last two saved addresses
                  final savedAddresses = locationController.savedAddresses;
                  final lastTwoAddresses =
                  savedAddresses.length > 2 ? savedAddresses.sublist(savedAddresses.length - 2) : savedAddresses;

                  return Column(
                    children: [
                      if (lastTwoAddresses.isNotEmpty)
                        for (int i = 0; i < lastTwoAddresses.length; i++)
                          Column(
                            children: [
                              _buildLocationTile(
                                leadingIcon: i == 0 ? "assets/images/maps_a.png" : "assets/images/maps_b.png",
                                title: lastTwoAddresses[i].street,
                                subtitle: "${lastTwoAddresses[i].buildingName}, ${lastTwoAddresses[i].apartmentNumber}",
                              ),
                              SizedBox(height: 8.h),
                            ],
                          ),
                      if (lastTwoAddresses.isEmpty)
                        _buildText("No saved locations found.", 14, FontWeight.w500, Colors.red),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: _buildText(
                              "Change",
                              14,
                              FontWeight.w600,
                              AppConstants.buttonColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),

              SizedBox(height: 12.h),
              _buildText("Promo Code?", 16, FontWeight.w600, Colors.black),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: InputWidget(
                      textEditingController: _promoController,
                      obscureText: false,
                      hintText: "Enter Your Promo",
                      hintColor: const Color(0xFF878787),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        bottomLeft: Radius.circular(10.r),
                      ),
                      backgroundColor: Colors.white,
                      borderColor: const Color(0xFFD6D6D6),
                      height: 60.h,
                      borderSide: BorderSide.none,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 60.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppConstants.buttonColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: _buildText(
                          "Add",
                          12,
                          FontWeight.w500,
                          Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 27.h),
              _buildText("Pay With:", 18, FontWeight.w600, Colors.black),
              Row(
                children: [
                  _buildRadioButton(
                    value: 'Card',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) => setState(() => _selectedPaymentMethod = value ?? 'Card'),
                    label: "Card",
                  ),
                  SizedBox(width: 20.w),
                  _buildRadioButton(
                    value: 'Cash',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) => setState(() => _selectedPaymentMethod = value ?? 'Cash'),
                    label: "Cash",
                  ),
                ],
              ),

              SizedBox(height: 27.h),
              _buildText("Card Type:", 18, FontWeight.w600, Colors.black),
              Row(
                children: [
                  _buildRadioButton(
                    value: 'Visa',
                    groupValue: _selectedCardMethod,
                    onChanged: (value) => setState(() => _selectedCardMethod = value ?? 'Visa'),
                    icon: Image.asset(
                      "assets/images/Visa.png",
                      height: 17.h,
                      width: 27.w,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  _buildRadioButton(
                    value: 'Master',
                    groupValue: _selectedCardMethod,
                    onChanged: (value) => setState(() => _selectedCardMethod = value ?? 'Master'),
                    icon: Image.asset(
                      "assets/images/Mastercard.png",
                      height: 17.h,
                      width: 27.w,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              CheckOutWidget(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddCardScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildText(
      String text,
      double fontSize,
      FontWeight fontWeight,
      Color color,
      ) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }

  Widget _buildRadioButton({
    required String value,
    required String groupValue,
    required ValueChanged<String?> onChanged,
    String? label,
    Widget? icon,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          activeColor: AppConstants.buttonColor,
          onChanged: onChanged,
        ),
        if (icon != null) ...[icon, SizedBox(width: 8.w)],
        _buildText(label ?? "", 16, FontWeight.w500, Colors.black),
      ],
    );
  }

  Widget _buildLocationTile({
    required String leadingIcon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(leadingIcon, height: 20.h, width: 20.w),
      title: _buildText(title, 15, FontWeight.w600, const Color(0xFF2F2E36)),
      subtitle: _buildText(
        subtitle,
        13,
        FontWeight.w600,
        const Color(0xFFBBBBBB),
      ),
    );
  }
}