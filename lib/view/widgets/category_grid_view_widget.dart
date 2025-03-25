import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryGridViewWidget extends StatelessWidget {
  final List<Widget> items;

  const CategoryGridViewWidget({required this.items, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: items.length,
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
        ),
      ],
    );
  }
}

