import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';

class RecommendItemWidget extends StatelessWidget {
  String image;
  String price;

  RecommendItemWidget({super.key, required this.image, required this.price});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(image, fit: BoxFit.fill, height: 108.h, width: 72.w),
        Positioned(
          right: 0,
          bottom: 20,
          child: Container(
            decoration: BoxDecoration(
              color: AppConstants.buttonColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 4),
              child: Text("\$${price}", style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}
