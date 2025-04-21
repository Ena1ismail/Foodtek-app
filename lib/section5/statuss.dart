import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../app_styles.dart';
import '../controller/lang_controller.dart';

class TimelineTile extends StatelessWidget {
  final bool isActive;
  final String text;
  final IconData icon;

  TimelineTile({
    required this.isActive,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: 15,
              width: 2,
              color: isActive ? Colors.green : Colors.grey,
            ),
            CircleAvatar(
              backgroundColor: isActive ? Colors.green : Color(0xffF7F7F7),
              child: Icon(
                icon,
                color: isActive ? Colors.white : Color(0xffA09CAB),
              ),
            ),
          ],
        ),
        SizedBox(width: 10.w),
        Text(
          text,
          style: AppStyles.getFontStyle(
            langController,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
