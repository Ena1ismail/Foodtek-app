import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../model/address.dart';
import '../view/screens/registration_screens/login_screen.dart';

class LocationController extends ChangeNotifier {
  // Location Permission Status
  bool _isLocationGranted = false;
  bool get isLocationGranted => _isLocationGranted;

  // TextEditingControllers for Address Fields
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController apartmentNumController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController additionalController = TextEditingController();

  // Check if Location Services are Enabled
  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  // Request Location Permission and Enable Location Services
  Future<void> requestLocationPermission(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      _isLocationGranted = false;
      notifyListeners();
      _showPermissionDeniedDialog(context);
    } else if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      _isLocationGranted = true;
      notifyListeners();
    }

    // If permission is granted, ensure location services are enabled
    if (_isLocationGranted) {
      bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
      if (!isLocationEnabled) {
        await Geolocator.openLocationSettings();
        _waitForLocationEnabled(context); // Wait for user to enable location
      } else {
        _navigateToLogin(context); // Navigate immediately if location is enabled
      }
    }
  }

  // Continuously Check if Location is Enabled, Then Navigate
  void _waitForLocationEnabled(BuildContext context) async {
    while (!(await Geolocator.isLocationServiceEnabled())) {
      await Future.delayed(const Duration(seconds: 1)); // Check every second
    }
    _navigateToLogin(context);
  }

  // Show Dialog When Location Permission is Denied Forever
  void _showPermissionDeniedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Location Permission Required"),
        content: const Text(
            "This app requires location permission to function properly. Please grant permission in settings."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  // Navigate to LoginScreen
  void _navigateToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  // Selected Location on Map
  LatLng? _selectedLocation;

  LatLng? get selectedLocation => _selectedLocation;

  void setSelectedLocation(LatLng location) {
    _selectedLocation = location;
    notifyListeners();
  }

  // Saved Addresses List
  final List<Address> _savedAddresses = [];

  List<Address> get savedAddresses => _savedAddresses;

  // Add a New Address
  void addAddress({
    required String areaName,
    required String buildingName,
    required String apartmentNumber,
    required String floor,
    required String street,
    required String additionalDirections,
    required LatLng location,
  }) {
    _savedAddresses.add(
      Address(
        areaName: areaName,
        buildingName: buildingName,
        apartmentNumber: apartmentNumber,
        floor: floor,
        street: street,
        additionalDirections: additionalDirections,
        location: location,
      ),
    );
    notifyListeners();
  }

  // Clear All Saved Addresses
  void clearAddresses() {
    _savedAddresses.clear();
    notifyListeners();
  }

  // Check if There Are Any Saved Addresses
  bool hasSavedAddresses() {
    return _savedAddresses.isNotEmpty;
  }

  // Validate All Address Fields
  bool validateFields() {
    return buildingController.text.isNotEmpty &&
        apartmentNumController.text.isNotEmpty &&
        floorController.text.isNotEmpty &&
        streetController.text.isNotEmpty;
  }

  // Save Current Address from Controllers
  void saveCurrentAddress(String areaName, LatLng location) {
    if (validateFields()) {
      addAddress(
        areaName: areaName,
        buildingName: buildingController.text,
        apartmentNumber: apartmentNumController.text,
        floor: floorController.text,
        street: streetController.text,
        additionalDirections: additionalController.text,
        location: location,
      );
      clearControllers();
    } else {
      throw Exception("All fields must be filled before saving an address.");
    }
  }

  void clearControllers() {
    buildingController.clear();
    apartmentNumController.clear();
    floorController.clear();
    streetController.clear();
    additionalController.clear();
  }


}