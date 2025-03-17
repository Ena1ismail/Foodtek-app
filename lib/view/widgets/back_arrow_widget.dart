import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackArrowWidget extends StatelessWidget {
  final Function() onPressed;
  const BackArrowWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: Image.asset(
          'assets/images/Vector.png',
          width: 24.w,
          height: 24.h,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
