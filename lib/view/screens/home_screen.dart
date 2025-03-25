import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../controller/home_page_controller.dart';
import '../widgets/category_buttons_widget.dart';
import '../widgets/category_grid_view_widget.dart';
import '../widgets/recommended_section_widget.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/swiper_widget.dart';
import '../widgets/top_rated_section_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SearchBarWidget(),
            CategoryButtonsWidget(),
            Consumer<HomePageController>(
              builder: (context, controller, child) {
                if (["Pizza", "Burger", "Sandwich"].contains(controller.selectedCategory)) {
                  return CategoryGridViewWidget(items: controller.getItemsForCategory());
                } else {
                  return Column(
                    children: [
                      SwiperWidget(),
                      TopRatedSectionWidget(),
                      RecommendedSectionWidget(),
                      SizedBox(height: 25.h),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}