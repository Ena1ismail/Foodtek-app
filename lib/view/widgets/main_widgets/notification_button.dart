import 'package:flutter/material.dart';

import 'notification_widget.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(4),
        ),
        child: IconButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return NotificationWidget();
              },
            );
          },
          icon: Image.asset(
            "assets/images/notification.png",
            height: 22,
            width: 22,
          ),
        ),
      ),
    );
  }
}
