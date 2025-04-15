import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/controller/location_controller.dart';
import 'package:foodtek/view/widgets/cart_widgets/check_out_widget.dart';
import 'package:foodtek/view/widgets/input_widget.dart';
import 'package:foodtek/view/widgets/main_widgets/notification_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../controller/check_out_controller.dart';
import '../../../l10n/app_localizations.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final TextEditingController _promoController = TextEditingController();

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final checkOutController = Provider.of<CheckOutController>(context);

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
              _buildText(
                AppLocalizations.of(context)!.checkout,
                20,
                FontWeight.w600,
                Colors.black,
              ),
              SizedBox(height: 18.h),

              _buildText(
                AppLocalizations.of(context)!.location,
                18,
                FontWeight.w600,
                Colors.black,
              ),
              SizedBox(height: 12.h),
              Consumer<LocationController>(
                builder: (context, locationController, child) {
                  final savedAddresses = locationController.savedAddresses;
                  final lastTwoAddresses =
                      savedAddresses.length > 2
                          ? savedAddresses.sublist(savedAddresses.length - 2)
                          : savedAddresses;

                  return Column(
                    children: [
                      if (lastTwoAddresses.isNotEmpty)
                        for (int i = 0; i < lastTwoAddresses.length; i++)
                          Column(
                            children: [
                              _buildLocationTileWithConditionalChangeButton(
                                leadingIcon:
                                    i == 0
                                        ? "assets/images/maps_a.png"
                                        : "assets/images/maps_b.png",
                                title: lastTwoAddresses[i].street,
                                subtitle:
                                    "${lastTwoAddresses[i].buildingName}, ${lastTwoAddresses[i].apartmentNumber}",
                                onChangePressed: () {
                                  print(
                                    "Change button pressed for address: ${lastTwoAddresses[i].street}",
                                  );
                                },
                                showChangeButton:
                                    lastTwoAddresses.length == 1
                                        ? i == 0
                                        : i == 1,
                              ),
                              SizedBox(height: 8.h),
                            ],
                          ),
                    ],
                  );
                },
              ),

              SizedBox(height: 12.h),
              _buildText(
                AppLocalizations.of(context)!.promo_code,
                16,
                FontWeight.w600,
                Colors.black,
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Flexible(
                    flex: 3,
                    child: InputWidget(
                      textEditingController: _promoController,
                      obscureText: false,
                      hintText: AppLocalizations.of(context)!.enter_your_promo,
                      hintColor: const Color(0xFF878787),
                      borderRadius: _getBorderRadiusBasedOnLanguage(
                        context,
                        false,
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
                        borderRadius: _getBorderRadiusBasedOnLanguage(
                          context,
                          true,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          checkOutController.setPromoCode(
                            _promoController.text,
                          );
                        },
                        child: _buildText(
                          AppLocalizations.of(context)!.add,
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
              _buildText(
                AppLocalizations.of(context)!.pay_with,
                18,
                FontWeight.w600,
                Colors.black,
              ),
              Row(
                children: [
                  _buildRadioButton(
                    value: AppLocalizations.of(context)!.card,
                    groupValue: checkOutController.selectedPaymentMethod!,
                    onChanged:
                        (value) => checkOutController.setSelectedPaymentMethod(
                          value ?? AppLocalizations.of(context)!.card,
                        ),
                    label: AppLocalizations.of(context)!.card,
                  ),
                  SizedBox(width: 20.w),
                  _buildRadioButton(
                    value: AppLocalizations.of(context)!.cash,
                    groupValue: checkOutController.selectedPaymentMethod!,
                    onChanged:
                        (value) => checkOutController.setSelectedPaymentMethod(
                          value ?? AppLocalizations.of(context)!.cash,
                        ),
                    label: AppLocalizations.of(context)!.cash,
                  ),
                ],
              ),

              SizedBox(height: 27.h),
              _buildText(
                AppLocalizations.of(context)!.card_type,
                18,
                FontWeight.w600,
                Colors.black,
              ),
              Row(
                children: [
                  _buildRadioButton(
                    value: AppLocalizations.of(context)!.visa,
                    groupValue: checkOutController.selectedCardType!,
                    onChanged:
                        (value) => checkOutController.setSelectedCardType(
                          value ?? AppLocalizations.of(context)!.visa,
                        ),
                    icon: Image.asset(
                      "assets/images/Visa.png",
                      height: 17.h,
                      width: 27.w,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  _buildRadioButton(
                    value: AppLocalizations.of(context)!.mastercard,
                    groupValue: checkOutController.selectedCardType!,
                    onChanged:
                        (value) => checkOutController.setSelectedCardType(
                          value ?? AppLocalizations.of(context)!.mastercard,
                        ),
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
                  checkOutController.navigateToNextScreen(context);
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

  Widget _buildLocationTileWithConditionalChangeButton({
    required String leadingIcon,
    required String title,
    required String subtitle,
    required VoidCallback onChangePressed,
    required bool showChangeButton,
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
      trailing:
          showChangeButton
              ? TextButton(
                onPressed: onChangePressed,
                child: _buildText(
                  AppLocalizations.of(context)!.change,
                  14,
                  FontWeight.w600,
                  AppConstants.buttonColor,
                ),
              )
              : null,
    );
  }

  BorderRadius _getBorderRadiusBasedOnLanguage(
      BuildContext context,
      bool isButton,
      ) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    final rtlBorderRadius = BorderRadius.only(
      topRight: Radius.circular(10.r),
      bottomRight: Radius.circular(10.r),
    );

    final ltrBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(10.r),
      bottomLeft: Radius.circular(10.r),
    );

    if (isArabic) {
      return isButton ? ltrBorderRadius : rtlBorderRadius;
    } else {
      return isButton ? rtlBorderRadius : ltrBorderRadius;
    }
  }
}
