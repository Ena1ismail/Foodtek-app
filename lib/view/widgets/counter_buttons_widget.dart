import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_constants.dart';

class IncrementalButton extends StatelessWidget {
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const IncrementalButton({
    super.key,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
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
            border: Border.all(color: AppConstants.buttonColor, width: 1.5.w)
          ),
          child: IconButton(
            onPressed: onDecrement,
            icon: const Icon(Icons.remove),
            color: AppConstants.buttonColor,
          ),
        ),

        Spacer(),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '$value',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),

        Spacer(),

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