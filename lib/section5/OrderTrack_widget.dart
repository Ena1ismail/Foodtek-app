import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderTrackStatusWidget extends StatelessWidget {
  const OrderTrackStatusWidget({super.key, required this.title, this.value});

  final String title;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
            color: value == 1 ? Colors.green : Color(0xff878787),
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 5.h),
        LinearProgressIndicator(
          backgroundColor: Color(0xff878787),
          value: value,
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.green,
          ),
        ),
      ],
    );
  }
}
