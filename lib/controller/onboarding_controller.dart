import 'package:flutter/material.dart';
import 'package:foodtek/l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import '../view/screens/onboarding_screens/location_screen.dart';
import '../view/screens/registration_screens/login_screen.dart';
import '../view/widgets/custom_button_widget.dart';
import '../view/widgets/onboarding_widgets/slides_widget.dart';

class SlidesController extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentPage = 0;

  List<Widget> slidesList(BuildContext context) {
    return [
      SlideWidget(
        imagePath: "assets/images/slide1.png",
        title: AppLocalizations.of(context)!.onboarding_title1,
        description: AppLocalizations.of(context)!.onboarding_subtitle1,
        widget: CustomButtonWidget(title: AppLocalizations.of(context)!.continue_to),
      ),
      SlideWidget(
        imagePath: "assets/images/slide2.png",
        title: AppLocalizations.of(context)!.onboarding_title2,
        description: AppLocalizations.of(context)!.onboarding_subtitle2,
        widget: CustomButtonWidget(title: AppLocalizations.of(context)!.continue_to),
      ),
      SlideWidget(
        imagePath: "assets/images/slide2.png",
        title: AppLocalizations.of(context)!.onboarding_title3,
        description: AppLocalizations.of(context)!.onboarding_subtitle3,
        widget: CustomButtonWidget(title: AppLocalizations.of(context)!.continue_to),
      ),
    ];
  }

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
    try {
      if (pageIndex < slidesList(context).length) {
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
    } catch (e) {
      print("Error checking location services: $e");
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}