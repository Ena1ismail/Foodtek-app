import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/controller/home_page_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryButtonsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildButton('All', 0, "assets/images/burger.png"),
            _buildButton('Burger', 1, "assets/images/burger.png"),
            _buildButton('Pizza', 2, "assets/images/pizza.png"),
            _buildButton('Sandwich', 3, "assets/images/sandwich.png"),
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
                if (label != 'All') Image.asset(image, height: 24, width: 24),
                if (label != 'All') SizedBox(width: 10),
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