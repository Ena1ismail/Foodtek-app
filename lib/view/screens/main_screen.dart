import 'package:flutter/material.dart';
import 'package:foodtek/view/screens/favourite_screen.dart';
import 'package:foodtek/view/screens/history_screen.dart';
import 'package:foodtek/view/screens/home_screen.dart';
import 'package:foodtek/view/screens/profile_screen.dart';
import '../../app_constants.dart';
import '../widgets/main_widgets/main_app_bar_widget.dart';
import '../widgets/main_widgets/main_bottom_navigation_bar.dart';

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
      appBar: MainAppBarWidget(),
      body: pages[activeIndex],
      bottomNavigationBar: MainBottomNavigationBar(
        activeIndex: activeIndex,
        onTabTapped: (index) {
          setState(() {
            activeIndex = index;
          });
        },
      ),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
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