import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimelineTile extends StatelessWidget {
  final bool isActive;
  final String text;
  final IconData icon;

  TimelineTile({required this.isActive, required this.text, required this.icon});
  @override
  Widget build(BuildContext context) {
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
                color:  isActive ? Colors.white : Color(0xffA09CAB),
              ),),],
        ),
        SizedBox(width: 10.w),
        Text(
          text,
          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: Color(0xff1C1B1F) ),
        ),
      ],
    );
  }
}
