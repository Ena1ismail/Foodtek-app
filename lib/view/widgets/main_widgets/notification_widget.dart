import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_page_controller.dart';
import '../../../l10n/app_localizations.dart';
import '../../../model/notification_item.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final homePageController = Provider.of<HomePageController>(context);

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
          SizedBox(height: 20.h),
          _buildAppBar(context),
          _buildToggleButtons(homePageController, context),
          Expanded(
            child: NotificationList(
              notifications: homePageController.getFilteredNotifications(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
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
        AppLocalizations.of(context)!.notifications,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
        ),
      ),
    );
  }

  Widget _buildToggleButtons(HomePageController controller, BuildContext context) {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(8),
      borderWidth: 0,
      borderColor: Colors.transparent,
      selectedBorderColor: Colors.transparent,
      fillColor: Colors.transparent,
      selectedColor: AppConstants.buttonColor,
      textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
      isSelected: [
        controller.selectedToggleIndex == 0,
        controller.selectedToggleIndex == 1,
        controller.selectedToggleIndex == 2,
      ],
      onPressed: (int index) {
        controller.updateSelectedToggleIndex(index);
      },
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(AppLocalizations.of(context)!.all_tab),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(AppLocalizations.of(context)!.unread_tab),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(AppLocalizations.of(context)!.read_tab),
        ),
      ],
    );
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
          AppLocalizations.of(context)!.no_notification,
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