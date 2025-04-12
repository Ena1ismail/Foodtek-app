import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/view/widgets/input_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:foodtek/controller/location_controller.dart';
import 'package:foodtek/view/widgets/cart_widgets/location_widget.dart';

class SetLocationScreen extends StatefulWidget {
  const SetLocationScreen({super.key});

  @override
  State<SetLocationScreen> createState() => _SetLocationScreenState();
}

class _SetLocationScreenState extends State<SetLocationScreen> {
  late GoogleMapController _mapController;
  LatLng? _selectedLocation;

  @override
  void initState() {
    super.initState();
    _determinePosition().then((position) {
      setState(() {
        _selectedLocation = LatLng(position.latitude, position.longitude);
      });
      _moveCameraToPosition(LatLng(position.latitude, position.longitude));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            initialCameraPosition: CameraPosition(
              target: LatLng(31.985934703432616, 35.900362288558114),
              zoom: 14,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            onCameraMove: (CameraPosition position) {
              // Update the selected location to the center of the map
              setState(() {
                _selectedLocation = position.target;
              });
            },
          ),

          // Fixed Marker (Centered)
          Center(
            child: Icon(Icons.location_on, color: Colors.red, size: 40.sp),
          ),

          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: InputWidget(
                textEditingController: TextEditingController(),
                obscureText: false,
                backgroundColor: Colors.white,
                borderRadius: BorderRadius.circular(40.r),
                borderColor: Colors.black12,
                hintText: "Find your location",
                prefixIcon: Icon(Icons.search, color: AppConstants.buttonColor),
                width: 340.w,
              ),
            ),
          ),

          Positioned(
            bottom: 20.h,
            left: 20.w,
            right: 20.w,
            child: Container(
              height: 60.h,
              child: ElevatedButton(
                onPressed:
                    _selectedLocation == null
                        ? null
                        : () {
                          // Save the selected location using Provider
                          Provider.of<LocationController>(
                            context,
                            listen: false,
                          ).setSelectedLocation(_selectedLocation!);

                          // Navigate to the LocationWidget screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LocationWidget(),
                            ),
                          );
                        },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppConstants.buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  "Set Location",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _moveCameraToPosition(LatLng position) async {
    await _mapController.animateCamera(
      CameraUpdate.newLatLngZoom(position, 14),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // Return the current position
    return await Geolocator.getCurrentPosition();
  }
}
