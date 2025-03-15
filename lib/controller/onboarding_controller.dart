import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../view/screens/location_screen.dart';
import '../view/screens/login_screen.dart';
import '../view/widgets/button_widget.dart';
import '../view/widgets/slides_widget.dart';

class SlidesController extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentPage = 0;

  List<Widget> slides = [
    SlideWidget(
      imagePath: "assets/images/slide1.png",
      title: "Welcome To Sahlah",
      description: "Enjoy Fast And Fresh Food Delivery At Your Doorstep.",
      widget: ButtonWidget(title: "Continue"),
    ),
    SlideWidget(
      imagePath: "assets/images/slide2.png",
      title: "Get Delivery On Time",
      description: "Our riders ensure timely delivery to your door.",
      widget: ButtonWidget(title: "Continue"),
    ),
    SlideWidget(
      imagePath: "assets/images/slide2.png",
      title: "Choose Your Food",
      description: "Select from a wide range of delicious meals.",
      widget: ButtonWidget(title: "Continue"),
    ),
  ];

  static const Duration animationDuration = Duration(milliseconds: 500);
  static const Curve animationCurve = Curves.easeInOut;

  void navigateToNext(BuildContext context) {
    _navigate(context, currentPage + 1);
  }

  void skip(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void _navigate(BuildContext context, int pageIndex) async {
    if (pageIndex < slides.length) {
      pageController.animateToPage(
        pageIndex,
        duration: animationDuration,
        curve: animationCurve,
      );
    } else {
      // Check if location services are enabled
      bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();

      if (isLocationEnabled) {
        // If location is enabled, go to LoginScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } else {
        // If location is disabled, go to LocationScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LocationScreen()),
        );
      }
    }
  }


  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
