import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/view/widgets/food_item_widget.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<FoodItemWidget> list = [
      FoodItemWidget(
        title: "Mexican Green Wave",
        description: "A pizza loaded with crunchy onions, crisp capsicum, juicy tomatoes",
        price: "\$23",
        imageUrl: "assets/images/pizza1.png",
      ),
      FoodItemWidget(
        title: "Peppy Paneer",
        description: "Chunky paneer with crisp capsicum and spicy red pepper",
        price: "\$13",
        imageUrl: "assets/images/pizza2.png",
      ),
      FoodItemWidget(
        title: "Pepperoni pizza",
        description: "Pepperoni pizza, Margarita Pizza Margherita Italian cuisine Tomato",
        price: "\$29",
        imageUrl: "assets/images/pizza3.png",
      ),
      FoodItemWidget(
        title: "Pizza Cheese",
        description: "Food pizza dish cuisine junk food, Fast Food, Flatbread, Ingredient",
        price: "\$23",
        imageUrl: "assets/images/pizza4.png",
      ),

    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: GridView.builder(
          itemCount: list.length,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
            childAspectRatio: .57,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
          ),
          itemBuilder: (context, index) {
            return list[index];
          },
        ),
      ),
    );
  }
}
