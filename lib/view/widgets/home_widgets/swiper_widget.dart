import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwiperWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              activeColor: Colors.green,
              color: Colors.grey[300],
              size: 6.0,
              activeSize: 10.0,
            ),
          ),
        ),
      ),
    );
  }
}