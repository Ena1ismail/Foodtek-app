import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/view/widgets/input_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:foodtek/controller/location_controller.dart';
import 'package:foodtek/view/screens/add_address_screen.dart';
import 'package:geocoding/geocoding.dart';

import '../../l10n/app_localizations.dart';

class SetLocationScreen extends StatefulWidget {
  const SetLocationScreen({super.key});

  @override
  State<SetLocationScreen> createState() => _SetLocationScreenState();
}

class _SetLocationScreenState extends State<SetLocationScreen> {
  late GoogleMapController _mapController;
  LatLng? _selectedLocation;
  String _locationName = "current location";

  @override
  void initState() {
    super.initState();
    _determinePosition().then((position) {
      setState(() {
        _selectedLocation = LatLng(position.latitude, position.longitude);
      });
      _moveCameraToPosition(LatLng(position.latitude, position.longitude));
      _fetchLocationName(
        position.latitude,
        position.longitude,
      ); // Fetch location name
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
              setState(() {
                _selectedLocation = position.target;
              });
              _fetchLocationName(
                position.target.latitude,
                position.target.longitude,
              ); // Update location name
            },
          ),

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
                hintText: AppLocalizations.of(context)!.find_your_location,
                prefixIcon: Icon(Icons.search, color: AppConstants.buttonColor),
                width: 340.w,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 200.h,
                width: 345.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 23.0, top: 24),
                      child: Text(
                        AppLocalizations.of(context)!.your_location,
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          color: Color(0xFF878787),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.pin_drop_outlined,
                        color: AppConstants.buttonColor,
                      ),
                      title: Text(
                        _locationName,
                        style: GoogleFonts.inter(
                          color: Colors.grey,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Center(
                      child: SizedBox(
                        height: 60.h,
                        width: 300.w,
                        child: ElevatedButton(
                          onPressed:
                              _selectedLocation == null
                                  ? null
                                  : () {
                                    Provider.of<LocationController>(
                                      context,
                                      listen: false,
                                    ).setSelectedLocation(_selectedLocation!);

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
                            AppLocalizations.of(context)!.set_location,
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
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: Icon(Icons.arrow_back)),
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

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error(AppLocalizations.of(context)!.location_services_are_disabled);
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(AppLocalizations.of(context)!.location_permissions_are_denied);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        AppLocalizations.of(context)!. location_permissions,
      );
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> _fetchLocationName(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );
      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;
        setState(() {
          _locationName =
              "${placemark.name ?? ''}, ${placemark.locality ?? ''}, ${placemark.administrativeArea ?? ''}";
        });
      } else {
        setState(() {
          _locationName = "Unknown Location";
        });
      }
    } catch (e) {
      setState(() {
        _locationName = "Error fetching location";
      });
    }
  }
}
