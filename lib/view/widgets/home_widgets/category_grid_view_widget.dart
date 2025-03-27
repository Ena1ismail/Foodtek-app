import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/view/widgets/home_widgets/food_item_widget.dart';

class CategoryGridViewWidget extends StatelessWidget {
  final List<FoodItemWidget> items;

  const CategoryGridViewWidget({required this.items, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
                childAspectRatio: 0.57,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
              ),
              itemBuilder: (context, index) {
                return items[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}

