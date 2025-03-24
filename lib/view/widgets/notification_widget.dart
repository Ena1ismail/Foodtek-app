import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/notification_item.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  List<bool> _selectedOptions = [true, false, false];

  final List<NotificationItem> notifications = [
    NotificationItem(
      title: "Delayed Order",
      message: "We're sorry! Your order is running late. New ETA: 10:30 PM.",
      date: "Last Wednesday at 9:42 AM",
      isError: true,
      isRead: false,
    ),
    NotificationItem(
      title: "Promotional Offer",
      message: "Get 20% off on your next order. Code: YUMMY20.",
      date: "Last Wednesday at 9:42 AM",
      isError: false,
      isRead: false,
    ),
    NotificationItem(
      title: "Out for Delivery",
      message: "Your order is on the way! Estimated arrival: 15 mins.",
      date: "Last Wednesday at 9:42 AM",
      isError: false,
      isRead: true,
    ),
    NotificationItem(
      title: "Order Confirmation",
      message: "Your order has been placed! We're preparing it now.",
      date: "Last Wednesday at 9:42 AM",
      isError: false,
      isRead: true,
    ),
    NotificationItem(
      title: "Delivered",
      message: "Enjoy your meal! Your order has been delivered.",
      date: "Last Wednesday at 9:42 AM",
      isError: false,
      isRead: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 20.h,),
          _buildAppBar(),
          _buildToggleButtons(),
          Expanded(
            child: NotificationList(
              notifications: _getFilteredNotifications(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.menu_outlined)),
      ],
      title: Text(
        "Notifications",
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
        ),
      ),
    );
  }

  Widget _buildToggleButtons() {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(8),
      borderWidth: 0,
      borderColor: Colors.transparent,
      selectedBorderColor: Colors.transparent,
      fillColor:Colors.transparent,
      selectedColor: AppConstants.buttonColor,

      textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
      isSelected: _selectedOptions,
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < _selectedOptions.length; i++) {
            _selectedOptions[i] = i == index;
          }
        });
      },
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text("All"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text("Unread"),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text("Read"),
        ),
      ],
    );
  }

  List<NotificationItem> _getFilteredNotifications() {
    if (_selectedOptions[0]) {
      return notifications;
    } else if (_selectedOptions[1]) {
      return notifications.where((n) => !n.isRead).toList();
    } else {
      return notifications.where((n) => n.isRead).toList();
    }
  }
}

class NotificationList extends StatelessWidget {
  final List<NotificationItem> notifications;

  const NotificationList({Key? key, required this.notifications}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (notifications.isEmpty) {
      return Center(
        child: Text(
          "No notifications to display.",
          style: TextStyle(fontSize: 16.sp, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return NotificationCard(notification: notification);
      },
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;

  const NotificationCard({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: .3),
        color: Color(0xFFF1F6FC),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 4),
            Text(
              notification.message,
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(height: 8),
            Text(
              notification.date,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}