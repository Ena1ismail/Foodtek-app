import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../controller/home_page_controller.dart';
import 'notification_widget.dart';

class MainAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final TabBar? tabBar;

  const MainAppBarWidget({super.key, this.tabBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: ListTile(
        leading: _buildLocationButton(),
        title: _buildLocationTitle(context),
        subtitle: _buildLocationSubtitle(),
      ),
      bottom: tabBar,
      actions: [_buildNotificationButton(context)],
    );
  }

  Widget _buildLocationButton() {
    return Consumer<HomePageController>(
      builder: (context, homePageController, child) {
        if (homePageController.isProductDetailsSelected) {
          return IconButton(
            onPressed: () {
              homePageController.toggleProductDetails();
            },
            icon: Icon(Icons.arrow_back),
          );
        } else {
          return Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Color(0xFFEDF7EF),
              borderRadius: BorderRadius.circular(4),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/images/location.png",
                height: 22,
                width: 22,
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildLocationTitle(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // showModalBottomSheet(
        //   context: context,
        //   isScrollControlled: true,
        //   builder: (BuildContext context) {
        //     return ChooseLocationWidget();
        //   },
        // );
      },
      child: Text(
        "Current location",
        style: GoogleFonts.inter(
          fontSize: 12,
          color: Color(0xFF606060),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildLocationSubtitle() {
    return Text(
      'Jl. Soekarno Hatta 15A...',
      style: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Color(0xFF101010),
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildNotificationButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
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

  @override
  Size get preferredSize {
    return tabBar == null
        ? Size.fromHeight(kToolbarHeight)
        : Size.fromHeight(kToolbarHeight * 2);
  }
}
