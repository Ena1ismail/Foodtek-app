import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'alexander.dart';
import 'track.dart';
import 'statuss.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  final List<String> statuses = [
    "Order received",
    "Cooking your order",
    "Courier is picking up order",
    "Order delivered",
  ];

  final List<IconData> icons = [
    Icons.check,
    Icons.call_to_action_outlined,
    Icons.person,
    Icons.home,
  ];

  final int currentStatus = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order Details",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Color(0xff391713),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Image.asset(
                    "assets/images/bag.png",
                    width: 44.w,
                    height: 44.h,
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order ID',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('#8979-4532'),
                      Text('25m'),
                    ],
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: statuses.length,
                itemBuilder: (context, index) {
                  return TimelineTile(
                    isActive: index <= currentStatus,
                    text: statuses[index],
                    icon: icons[index],
                  );
                },
              ),
              SizedBox(height: 20.h),

              Alexander(),
              SizedBox(height: 10.h),

              Container(height: 1.h, width: 440.w, color: Color(0xffF5F5F5)),
              SizedBox(height: 50.h),

              Center(
                child: SizedBox(
                  width: 295.w,
                  height: 48.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Live Track",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
