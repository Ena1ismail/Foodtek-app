import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/view/widgets/input_widget.dart';
import 'package:foodtek/view/widgets/main_widgets/main_app_bar_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../controller/filter_controller.dart';

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
              _buildHeader("Filter"),
              _buildSectionTitle("Price range"),
              SizedBox(height: 24.h,),
              _buildPriceInputs(context),
              _buildSlider(context, "price"),
              _buildSectionTitle("Discount"),
              SizedBox(height: 24.h,),
              _buildDiscountInputs(context),
              _buildSlider(context, "discount"),
              SizedBox(height: 24.h,),
              _buildSectionTitle("Category"),
              SizedBox(height: 14.h,),
              _buildButtonRow([
                "Fast Food",
                "Sea Food",
                "Desert",
              ], "category"),
              _buildSectionTitle("Location"),
              SizedBox(height: 14.h,),
              _buildButtonRow([
                "1 KM",
                "5 KM",
                "10 KM",
              ], "location"),
              _buildSectionTitle("Dish"),
              SizedBox(height: 14.h,),
              _buildButtonWrap([
                "Tuna Tartare",
                "Spicy Crab Cakes",
                "Seafood Paella",
                "Clam Chowder",
                "Miso-Glazed Cod",
                "Lobster Thermidor",
              ], "dish"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 14.sp,
          color: Color(0xFF98A0B4),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildPriceInputs(BuildContext context) {
    return Consumer<FilterController>(
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
    );
  }

  Widget _buildDiscountInputs(BuildContext context) {
    return Consumer<FilterController>(
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
    );
  }

  Widget _buildSlider(BuildContext context, String type) {
    return Consumer<FilterController>(
      builder: (context, filterController, child) {
        final minValue = type == "price"
            ? int.tryParse(filterController.minPriceController.text) ?? 0
            : int.tryParse(filterController.minDiscountController.text) ?? 0;
        final maxValue = type == "price"
            ? int.tryParse(filterController.maxPriceController.text) ?? 10
            : int.tryParse(filterController.maxDiscountController.text) ?? 50;

        if (minValue > maxValue) {
          if (type == "price") {
            filterController.minPriceController.text = "0";
          } else {
            filterController.minDiscountController.text = "0";
          }
        }

        return SfSlider(
          min: minValue.toDouble(),
          max: maxValue.toDouble(),
          value: type == "price"
              ? filterController.sliderPriceValue
              : filterController.sliderDiscountValue,
          showLabels: true,
          labelFormatterCallback: (
              dynamic actualValue,
              String formattedText,
              ) {
            final formattedMinValue = type == "price"
                ? "\$${filterController.minPriceController.text}"
                : "\$${filterController.minDiscountController.text}";
            final formattedMaxValue = type == "price"
                ? "\$${filterController.maxPriceController.text}"
                : "\$${filterController.maxDiscountController.text}";

            return actualValue <= 5 ? formattedMinValue : formattedMaxValue;
          },
          inactiveColor: Color(0xFFF3F4F6),
          activeColor: AppConstants.buttonColor,
          onChanged: (dynamic newValue) {
            if (type == "price") {
              filterController.updateSlider("price", newValue);
            } else {
              filterController.updateSlider("discount", newValue);
            }
          },
        );
      },
    );
  }

  Widget _buildButtonRow(List<String> labels, String type) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: labels.map((label) {
          final index = labels.indexOf(label);
          return _buildButton(label, index, type);
        }).toList(),
      ),
    );
  }

  // Button Wrap Widget
  Widget _buildButtonWrap(List<String> labels, String type) {
    return Wrap(
      spacing: 16.w,
      runSpacing: 8.h,
      children: labels.map((label) {
        final index = labels.indexOf(label);
        return _buildButton(label, index, type);
      }).toList(),
    );
  }

  Widget _buildButton(String label, int index, String type) {
    return Consumer<FilterController>(
      builder: (context, controller, child) {
        final isSelected = type == "category"
            ? controller.selectedCategoryIndex == index
            : type == "location"
            ? controller.selectedLocationIndex == index
            : controller.selectedDishIndex == index;

        return Container(
          margin: EdgeInsets.only(right: 16.0),
          child: TextButton(
            onPressed: () {
              controller.updateSelected(type, label, index);
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
  }
}