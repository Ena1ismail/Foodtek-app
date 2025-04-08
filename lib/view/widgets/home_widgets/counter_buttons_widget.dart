import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../app_constants.dart';

class CounterButtonsWidget extends StatelessWidget {
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final Color? color;

  const CounterButtonsWidget({
    super.key,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 45.h,
          width: 45.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.r),
            color: color ?? Colors.white,
            border: Border.all(color: color ?? AppConstants.buttonColor, width: 1.5.w),
          ),
          child: IconButton(
            onPressed: onDecrement,
            icon: const Icon(Icons.remove),
            color: AppConstants.buttonColor,
          ),
        ),

        SizedBox(width: 10.w),

        Text(
          '$value',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),

        SizedBox(width: 10.w),

        Container(
          height: 45.h,
          width: 45.h,
          decoration: BoxDecoration(
            color: AppConstants.buttonColor,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: IconButton(
            onPressed: onIncrement,
            icon: const Icon(Icons.add),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}