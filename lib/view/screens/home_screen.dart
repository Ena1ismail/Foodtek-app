import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/l10n/app_localizations.dart';
import 'package:foodtek/view/screens/product_details_screen.dart';
import 'package:provider/provider.dart';
import '../../controller/home_page_controller.dart';
import '../widgets/home_widgets/category_buttons_widget.dart';
import '../widgets/home_widgets/category_grid_view_widget.dart';
import '../widgets/home_widgets/recommended_section_widget.dart';
import '../widgets/home_widgets/search_bar_widget.dart';
import '../widgets/home_widgets/swiper_widget.dart';
import '../widgets/home_widgets/top_rated_section_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageController>(
      builder: (context, homePageController, child) {
        if (homePageController.isProductDetailsSelected) {
          return ProductDetailsWidget(foodItem: homePageController.foodItem);
        } else {
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
                  if ([
                    AppLocalizations.of(context)!.pizza_category,
                    AppLocalizations.of(context)!.burger_category,
                    AppLocalizations.of(context)!.sandwich_category,
                  ].contains(homePageController.selectedCategory))
                    CategoryGridViewWidget(
                      items: homePageController.getItemsForCategory(context),
                    )
                  else
                    Column(
                      children: [
                        SwiperWidget(),
                        TopRatedSectionWidget(),
                        RecommendedSectionWidget(),
                        SizedBox(height: 25.h),
                      ],
                    ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
