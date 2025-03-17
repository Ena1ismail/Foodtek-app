import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumberInput extends StatelessWidget {
  final String flag; // The flag emoji or image
  final String dialCode; // Country dial code
  final TextEditingController controller;

  PhoneNumberInput({
    Key? key,
    required this.flag,
    required this.dialCode,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 46.h,
          width: 295.w,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  flag,
                  style: TextStyle(fontSize: 24), // Adjust size as needed
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_drop_down),
                onPressed: () {
                  // Handle country selection
                },
              ),
              VerticalDivider(
                width: 1,
                thickness: 1,
                color: Colors.grey.shade300,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('($dialCode)', style: TextStyle(fontSize: 16)),
              ),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Phone number",
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xFFBBBFC5),
                      fontWeight: FontWeight.w500,
                    ),// Placeholder text
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
