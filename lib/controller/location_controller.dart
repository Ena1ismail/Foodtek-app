import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../view/screens/registration_screens/login_screen.dart';

class LocationController extends ChangeNotifier {
  bool _isLocationGranted = false;
  bool get isLocationGranted => _isLocationGranted;

  // Check if location services are enabled
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  // Request location permission and enable location services
  Future<void> requestLocationPermission(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      _isLocationGranted = false;
    } else if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      _isLocationGranted = true;
    }

    notifyListeners();

    // If permission is granted, ensure location services are enabled
    if (_isLocationGranted) {
      bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isLocationEnabled) {
        await Geolocator.openLocationSettings();

        // Wait and check if the user enables location
        _waitForLocationEnabled(context);
      } else {
        // If already enabled, navigate to login immediately
        _navigateToLogin(context);
      }
    }
  }

  // Continuously check if location is enabled, then navigate
  void _waitForLocationEnabled(BuildContext context) async {
    while (!(await Geolocator.isLocationServiceEnabled())) {
      await Future.delayed(Duration(seconds: 1)); // Check every second
    }
    _navigateToLogin(context);
  }

  // Navigate to LoginScreen
  void _navigateToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
