import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/view/widgets/input_widget.dart';
import 'package:foodtek/view/widgets/main_widgets/main_app_bar_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../controller/filter_controller.dart';
import '../../controller/home_page_controller.dart';

class FilterSearchScreen extends StatelessWidget {
  const FilterSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Filter",
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Price range",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: Color(0xFF98A0B4),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 24.h),
              Consumer<FilterController>(
                builder: (context, filterController, child) {
                  return Row(
                    children: [
                      InputWidget(
                        textEditingController: filterController.minPriceController,
                        obscureText: false,
                        borderRadius: 5.r,
                        width: 180.w,
                        keyboardType: TextInputType.number,
                        borderColor: Color(0xFFEAFAEB),
                        backgroundColor: Colors.white,
                        label: "Min",
                      ),
                      SizedBox(width: 16.w),
                      InputWidget(
                        textEditingController: filterController.maxPriceController,
                        obscureText: false,
                        borderRadius: 5.r,
                        width: 180.w,
                        keyboardType: TextInputType.number,
                        borderColor: Color(0xFFEAFAEB),
                        backgroundColor: Colors.white,
                        label: "Max",
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 20.h),
              Consumer<FilterController>(
                builder: (context, filterController, child) {
                  final minValue =
                  filterController.minPriceController.text.isEmpty
                      ? 0
                      : int.tryParse(filterController.minPriceController.text) ?? 0;
                  final maxValue =
                  filterController.maxPriceController.text.isEmpty
                      ? 10
                      : int.tryParse(filterController.maxPriceController.text) ?? 10;

                  if (minValue > maxValue) {
                    filterController.minPriceController.text = "0";
                    // maxController.text = minValue.toString();
                  }

                  return SfSlider(
                    min: minValue.toDouble(),
                    max: maxValue.toDouble(),
                    value: filterController.sliderPriceValue,
                    showLabels: true,
                    labelFormatterCallback: (
                        dynamic actualValue,
                        String formattedText,
                        ) {
                      final formattedMinValue =
                      filterController.minPriceController.text.isEmpty
                          ? '\$0'
                          : "\$${filterController.minPriceController.text}";
                      final formattedMaxValue =
                      filterController.maxPriceController.text.isEmpty
                          ? '\$10'
                          : "\$${filterController.maxPriceController.text}";

                      return actualValue <= 5
                          ? formattedMinValue
                          : formattedMaxValue;
                    },
                    inactiveColor: Color(0xFFF3F4F6),
                    activeColor: AppConstants.buttonColor,
                    onChanged: (dynamic newValue) {
                      filterController.updateSliderPriceValue(newValue);
                    },
                  );
                },
              ),
              SizedBox(height: 30.h),
              Text(
                "Discount",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: Color(0xFF98A0B4),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 24.h),
              Consumer<FilterController>(
                builder: (context, filterController, child) {
                  return Row(
                    children: [
                      InputWidget(
                        textEditingController: filterController.minDiscountController,
                        obscureText: false,
                        borderRadius: 5.r,
                        width: 180.w,
                        keyboardType: TextInputType.number,
                        borderColor: Color(0xFFEAFAEB),
                        backgroundColor: Colors.white,
                        label: "Min",
                      ),
                      SizedBox(width: 16.w),
                      InputWidget(
                        textEditingController: filterController.maxDiscountController,
                        obscureText: false,
                        borderRadius: 5.r,
                        width: 180.w,
                        keyboardType: TextInputType.number,
                        borderColor: Color(0xFFEAFAEB),
                        backgroundColor: Colors.white,
                        label: "Max",
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 20.h),
              Consumer<FilterController>(
                builder: (context, filterController, child) {
                  final minValue =
                  filterController.minDiscountController.text.isEmpty
                      ? 0
                      : int.tryParse(filterController.minDiscountController.text) ?? 0;
                  final maxValue =
                  filterController.maxDiscountController.text.isEmpty
                      ? 10
                      : int.tryParse(filterController.maxDiscountController.text) ?? 50;

                  if (minValue > maxValue) {
                    filterController.minDiscountController.text = "0";
                  }

                  return SfSlider(
                    min: minValue.toDouble(),
                    max: maxValue.toDouble(),
                    value: filterController.sliderDiscountValue,
                    showLabels: true,
                    labelFormatterCallback: (
                        dynamic actualValue,
                        String formattedText,
                        ) {
                      final formattedMinValue =
                      filterController.minDiscountController.text.isEmpty
                          ? '\$0'
                          : "\$${filterController.minDiscountController.text}";
                      final formattedMaxValue =
                      filterController.maxDiscountController.text.isEmpty
                          ? '\$10'
                          : "\$${filterController.maxDiscountController.text}";

                      return actualValue <= 5
                          ? formattedMinValue
                          : formattedMaxValue;
                    },
                    inactiveColor: Color(0xFFF3F4F6),
                    activeColor: AppConstants.buttonColor,
                    onChanged: (dynamic newValue) {
                      filterController.updateSliderDiscountValue(newValue);
                    },
                  );
                },
              ),
              SizedBox(height: 24.h),
              Text(
                "Category",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: Color(0xFF98A0B4),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildButton('Fast Food', 0, 'dish'),
                  _buildButton('Sea Food', 1, 'dish'),
                  _buildButton('Desert', 2, 'dish'),
                ],
              ),
              SizedBox(height: 24.h),
              Text(
                "Location",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: Color(0xFF98A0B4),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildButton('1 KM', 0, 'location'),
                  _buildButton('5 KM', 1, 'location'),
                  _buildButton('10 KM', 2, 'location'),
                ],
              ),
              SizedBox(height: 24.h),
              Text(
                "Dish",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: Color(0xFF98A0B4),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 24.h),
              Wrap(
                children: [
                  _buildButton('Tuna Tartare', 0, "category"),
                  _buildButton('Spicy Crab Cakes', 1, "category"),
                  _buildButton('Seafood Paella', 2, "category"),
                  _buildButton('Clam Chowder', 3, "category"),
                  _buildButton('Miso-Glazed Cod', 4, "category"),
                  _buildButton('Lobster Thermidor', 5, "category"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String label, int index, String type) {
    return Consumer<FilterController>(
      builder: (context, controller, child) {
        bool isSelected = false;

        // Determine selection based on type
        if (type == 'category') {
          isSelected = controller.selectedCategoryIndex == index;
        } else if (type == 'location') {
          isSelected = controller.selectedLocationIndex == index;
        } else if (type == 'dish') {
          isSelected = controller.selectedDishIndex == index;
        }

        return Container(
          margin: EdgeInsets.only(right: 16.0),
          child: TextButton(
            onPressed: () {
              // Update selection based on type
              if (type == 'category') {
                controller.updateSelectedCategory(label);
                controller.updateSelectedCategoryIndex(index);
              } else if (type == 'location') {
                controller.updateSelectedLocation(label);
                controller.updateSelectedLocationIndex(index);
              } else if (type == 'dish') {
                controller.updateSelectedDish(label);
                controller.updateSelectedDishIndex(index);
              }
            },
            style: TextButton.styleFrom(
              backgroundColor: isSelected ? Colors.green : Color(0xFFF2F4F7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              label,
              style: GoogleFonts.poppins(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      },
    );
  }}
