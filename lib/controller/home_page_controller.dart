import 'package:flutter/material.dart';

class HomePageController extends ChangeNotifier{
  TextEditingController searchTextEditingController = TextEditingController();
  int selectedIndex = 0;
  final PageController pageController = PageController();


  void updateSelectedIndex(int index) {
    if (selectedIndex != index) {
      selectedIndex = index;
      notifyListeners();
    }
  }

}
