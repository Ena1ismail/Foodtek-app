import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/controller/home_page_controller.dart';
import 'package:foodtek/view/widgets/recommend_item_widget.dart';
import 'package:foodtek/view/widgets/top_rated_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../widgets/input_widget.dart';

class HomeScreen extends StatelessWidget {

  List<TopRatedWidget> topRatedItems = [
    TopRatedWidget(
      rating: "3.8",
      image: "assets/images/top_rated1.png",
      name: "Chicken burger",
      ingredients: "100 gr chicken + tomato + cheese Lettuce",
      price: "\$20.00",
    ),
    TopRatedWidget(
      rating: "4.5",
      image: "assets/images/top_rated2.png",
      ingredients: "100 gr meat + onion + tomato + Lettuce cheese",
      name: "Cheese burger",
      price: "\$15.00",
    ),
    TopRatedWidget(
      rating: "3.8",
      image: "assets/images/top_rated1.png",
      name: "Chicken burger",
      ingredients: "100 gr chicken + tomato + cheese Lettuce",
      price: "\$20.00",
    ),
    TopRatedWidget(
      rating: "4.5",
      image: "assets/images/top_rated2.png",
      ingredients: "100 gr meat + onion + tomato + Lettuce cheese",
      name: "Cheese burger",
      price: "\$15.00",
    ),
    TopRatedWidget(
      rating: "3.8",
      image: "assets/images/top_rated1.png",
      name: "Chicken burger",
      ingredients: "100 gr chicken + tomato + cheese Lettuce",
      price: "\$20.00",
    ),
  ];

  List<RecommendItemWidget> recommendedItems = [
    RecommendItemWidget(image: "assets/images/recomended1.png", price: "103.0"),
    RecommendItemWidget(image: "assets/images/recomended2.png", price: "50.0"),
    RecommendItemWidget(image: "assets/images/recmended3.png", price: "12.99"),
    RecommendItemWidget(image: "assets/images/recomended4.png", price: "8.20"),
  ];

  @override
  Widget build(BuildContext context) {
    final homePageController = Provider.of<HomePageController>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildSearchBar(homePageController),
            _buildCategoryButtons(),
            _buildSwiper(),
            _buildTopRatedSection(),
            _buildRecommendedSection(),
            SizedBox(height: 25.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(HomePageController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          InputWidget(
            borderRadius: 40.r,
            width: 370.w,
            height: 55.h,
            borderColor: Color(0xFFD6D6D6),
            borderSide: BorderSide(color: Colors.transparent),
            textEditingController: controller.searchTextEditingController,
            obscureText: false,
            prefixIcon: Icon(Icons.search, color: Color(0xFF878787)),
            backgroundColor: Colors.white,
            hintText: "Search menu, restaurant or etc",
            hintColor: Color(0xFF878787),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/images/filter.png",
                height: 18.h,
                width: 18.w,
              ),
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  Widget _buildCategoryButtons() {
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

  Widget _buildSwiper() {
    return Center(
      child: SizedBox(
        height: 165.h,
        width: 370.w,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              "assets/images/offers.png",
              fit: BoxFit.contain,
            );
          },
          itemCount: 5,
          autoplay: true,
          duration: 350,
          layout: SwiperLayout.DEFAULT,
          pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 0),
            builder: DotSwiperPaginationBuilder(
              activeColor: AppConstants.buttonColor,
              color: Colors.grey[300],
              size: 6.0,
              activeSize: 10.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopRatedSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Top Rated",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
                color: Colors.black,
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 250.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: topRatedItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12),
                child: topRatedItems[index],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendedSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommend",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "View All >",
                  style: GoogleFonts.inter(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppConstants.buttonColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          height: 110.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: recommendedItems.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 25.r),
                child: recommendedItems[index],
              );
            },
          ),
        ),
      ],
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
            },
            style: TextButton.styleFrom(
              backgroundColor: isSelected ? AppConstants.buttonColor : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: Color(0xFF85DE9E)),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  if (label != 'All') Image.asset(image, height: 24, width: 24),
                  if (label != 'All') SizedBox(width: 10),
                  Text(
                    label,
                    style: GoogleFonts.poppins(
                      color: isSelected ? Colors.white : Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}