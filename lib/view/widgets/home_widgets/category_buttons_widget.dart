import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/controller/home_page_controller.dart';
import 'package:foodtek/l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryButtonsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildButton(AppLocalizations.of(context)!.all_tab, 0, "assets/images/burger.png"),
            _buildButton(AppLocalizations.of(context)!.burger_category, 1, "assets/images/burger.png"),
            _buildButton(AppLocalizations.of(context)!.pizza_category, 2, "assets/images/pizza.png"),
            _buildButton(AppLocalizations.of(context)!.sandwich_category, 3, "assets/images/sandwich.png"),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String label, int index, String image) {
    return Consumer<HomePageController>(
      builder: (context, controller, child) {
        bool isSelected = controller.selectedIndex == index;
        return Container(
          margin: EdgeInsets.only(right: 12.0),
          child: TextButton(
            onPressed: () {
              controller.updateSelectedIndex(index);
              controller.updateSelectedCategory(label);
            },
            style: TextButton.styleFrom(
              backgroundColor: isSelected ? Colors.green : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: Color(0xFF85DE9E)),
              ),
            ),
            child: Row(
              children: [
                if (label != AppLocalizations.of(context)!.all_category) Image.asset(image, height: 24, width: 24),
                if (label != AppLocalizations.of(context)!.all_category) SizedBox(width: 10),
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}