import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../view/screens/onboarding_screens/location_screen.dart';
import '../view/screens/registration_screens/login_screen.dart';
import '../view/widgets/custom_button_widget.dart';
import '../view/widgets/onboarding_widgets/slides_widget.dart';

class SlidesController extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentPage = 0;

  List<Widget> slides = [
    SlideWidget(
      imagePath: "assets/images/slide1.png",
      title: "Welcome To Sahlah",
      description: "Enjoy Fast And Fresh Food Delivery At Your Doorstep.",
      widget: CustomButtonWidget(title: "Continue"),
    ),
    SlideWidget(
      imagePath: "assets/images/slide2.png",
      title: "Get Delivery On Time",
      description: "Our riders ensure timely delivery to your door.",
      widget: CustomButtonWidget(title: "Continue"),
    ),
    SlideWidget(
      imagePath: "assets/images/slide2.png",
      title: "Choose Your Food",
      description: "Select from a wide range of delicious meals.",
      widget: CustomButtonWidget(title: "Continue"),
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
      bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();

      if (isLocationEnabled) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      } else {
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
