import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatViewWidget extends StatelessWidget {
  final List<String> messages;

  ChatViewWidget({required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      reverse: true,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment:
              index % 2 == 0
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              decoration: BoxDecoration(
                color: index % 2 == 0 ? Color(0xff25AE4B) : Color(0xffEEEEEE),
                borderRadius:
                    index % 2 == 0
                        ? BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        )
                        : BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
              ),

              child: Text(
                messages[index],
                style: TextStyle(
                  color: index % 2 == 0 ? Colors.white : Color(0xff505050),
                  fontSize: 13.sp,
                  fontWeight:
                      index % 2 == 0 ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 30.h),
          ],
        );
      },
    );
  }
}
