import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../app_styles.dart';
import '../../../controller/home_page_controller.dart';
import '../../../controller/lang_controller.dart';
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
        color: Theme.of(context).scaffoldBackgroundColor,
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
    LangController langController =
    Provider.of<LangController>(context, listen: false);
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
        style: AppStyles.getFontStyle( langController,
          fontWeight: FontWeight.w600,
          fontSize: 24.sp,
          color: Theme.of(context).primaryColor,
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
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    final String localizedTitle = _getLocalizedTitle(context, notification.title);
    final String localizedMessage = _getLocalizedMessage(context, notification.message);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: .3),
        color: isDarkMode ? Colors.grey : const Color(0xFFF1F6FC),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizedTitle,
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 4.h),
            Text(
              localizedMessage,
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(height: 8.h),
            Text(
              notification.date,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  String _getLocalizedTitle(BuildContext context, String titleKey) {
    switch (titleKey) {
      case 'delayed_order_title':
        return AppLocalizations.of(context)!.delayed_order_title;
      case 'promotional_offer_title':
        return AppLocalizations.of(context)!.promotional_offer_title;
      case 'out_for_delivery_title':
        return AppLocalizations.of(context)!.out_for_delivery_title;
      case 'order_confirmation_title':
        return AppLocalizations.of(context)!.order_confirmation_title;
      case 'delivered_title':
        return AppLocalizations.of(context)!.delivered_title;
      default:
        throw Exception('Localization key not found: $titleKey');
    }
  }

  String _getLocalizedMessage(BuildContext context, String messageKey) {
    switch (messageKey) {
      case 'delayed_order_message':
        return AppLocalizations.of(context)!.delayed_order_message;
      case 'promotional_offer_message':
        return AppLocalizations.of(context)!.promotional_offer_message;
      case 'out_for_delivery_message':
        return AppLocalizations.of(context)!.out_for_delivery_message;
      case 'order_confirmation_message':
        return AppLocalizations.of(context)!.order_confirmation_message;
      case 'delivered_message':
        return AppLocalizations.of(context)!.delivered_message;
      default:
        throw Exception('Localization key not found: $messageKey');
    }
  }
}