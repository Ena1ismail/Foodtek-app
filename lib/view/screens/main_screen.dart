import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/view/screens/cart_screen.dart';
import 'package:foodtek/view/screens/favourite_screen.dart';
import 'package:foodtek/view/screens/history_screen.dart';
import 'package:foodtek/view/screens/home_screen.dart';
import 'package:foodtek/view/screens/profile_screen.dart';
import 'package:foodtek/view/widgets/choose_location_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/notification_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int activeIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    FavouriteScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: pages[activeIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: ListTile(
        leading: _buildLocationButton(),
        title: _buildLocationTitle(),
        subtitle: _buildLocationSubtitle(),
      ),
      actions: [_buildNotificationButton()],
    );
  }

  Widget _buildLocationButton() {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: Color(0xFFEDF7EF),
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
          "assets/images/location.png",
          height: 22,
          width: 22,
        ),
      ),
    );
  }

  Widget _buildLocationTitle() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return ChooseLocationWidget();
          },
        );
      },
      child: Text(
        "Current location ",
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

  Widget _buildNotificationButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: 45,
        width: 45,
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

  AnimatedBottomNavigationBar _buildBottomNavigationBar() {
    return AnimatedBottomNavigationBar(
      icons: const [
        Icons.home_outlined,
        Icons.favorite_border,
        Icons.access_time,
        Icons.person_outline,
      ],
      backgroundColor: Color(0xFFDBF4D1),
      activeIndex: activeIndex,
      gapLocation: GapLocation.center,
      activeColor: AppConstants.buttonColor,
      inactiveColor: Colors.black54,
      notchSmoothness: NotchSmoothness.softEdge,
      shadow: BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
      onTap: (index) {
        setState(() {
          activeIndex = index;
        });
      },
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: AppConstants.buttonColor,
      elevation: 0,
      shape: const CircleBorder(),
      child: Icon(Icons.shopping_cart_outlined, color: Colors.white),
    );
  }
}