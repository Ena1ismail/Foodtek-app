import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/l10n/app_localizations.dart';
import 'package:foodtek/view/widgets/custom_button_widget.dart';
import 'package:foodtek/view/widgets/input_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:foodtek/controller/location_controller.dart';
import 'package:geocoding/geocoding.dart';

import '../../app_styles.dart';
import '../../controller/lang_controller.dart';
import 'cart_screens/check_out_screen.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  Set<Marker> markers = {};
  String _areaName = "Unknown Area";
  LatLng? _selectedLocation;

  @override
  void initState() {
    super.initState();
    _loadSavedLocation();
  }

  void _loadSavedLocation() {
    final savedLocation =
        Provider.of<LocationController>(
          context,
          listen: false,
        ).selectedLocation;

    if (savedLocation != null) {
      setState(() {
        _selectedLocation = savedLocation;
        markers.add(
          Marker(
            markerId: MarkerId('saved_location'),
            position: savedLocation,
            infoWindow: InfoWindow(title: "Selected Location"),
          ),
        );
      });

      _fetchAreaName(savedLocation.latitude, savedLocation.longitude);
    }
  }

  @override
  Widget build(BuildContext context) {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final locationController = Provider.of<LocationController>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.new_address,
          style: AppStyles.getFontStyle(
            langController,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            children: [
              SizedBox(
                height: 200.h,
                width: double.infinity,
                child: GoogleMap(
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  markers: markers,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(31.985934703432616, 35.900362288558114),
                    zoom: 14,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    final savedLocation =
                        Provider.of<LocationController>(
                          context,
                          listen: false,
                        ).selectedLocation;
                    if (savedLocation != null) {}
                  },
                  onCameraIdle: () {
                    _fetchAreaNameFromMap();
                  },
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                height: 80.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: isDarkMode ? Colors.grey : Colors.black12,
                  ),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: ListTile(
                  leading: Icon(Icons.location_pin, color: Colors.grey),
                  title: Text(AppLocalizations.of(context)!.area),
                  subtitle: Text(_areaName),
                  trailing: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.change,
                      style: AppStyles.getFontStyle(
                        langController,
                        color: AppConstants.buttonColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              InputWidget(
                textEditingController: locationController.buildingController,
                obscureText: false,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                borderColor: isDarkMode ? Colors.grey : Colors.black12,
                hintText: AppLocalizations.of(context)!.building_name,
                label: AppLocalizations.of(context)!.building_name,
                width: double.infinity,
                labelColor: Theme.of(context).primaryColor,

              ),
              SizedBox(height: 20.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InputWidget(
                      textEditingController:
                          locationController.apartmentNumController,
                      obscureText: false,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      borderColor: isDarkMode ? Colors.grey : Colors.black12,
                      hintText: AppLocalizations.of(context)!.apt_number,
                      label: AppLocalizations.of(context)!.apt_number,
                      width: 180.w,
                      keyboardType: TextInputType.number,
                      labelColor: Theme.of(context).primaryColor,

                    ),
                    SizedBox(width: 20.w),
                    InputWidget(
                      textEditingController: locationController.floorController,
                      obscureText: false,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      borderColor: isDarkMode ? Colors.grey : Colors.black12,
                      hintText: AppLocalizations.of(context)!.floor,
                      label: AppLocalizations.of(context)!.floor,
                      width: 180.w,
                      keyboardType: TextInputType.number,
                      labelColor: Theme.of(context).primaryColor,

                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              InputWidget(
                textEditingController: locationController.streetController,
                obscureText: false,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                borderColor: isDarkMode ? Colors.grey : Colors.black12,
                hintText: AppLocalizations.of(context)!.street,
                label: AppLocalizations.of(context)!.street,
                width: double.infinity,
                labelColor: Theme.of(context).primaryColor,

              ),
              SizedBox(height: 20.h),
              InputWidget(
                textEditingController: locationController.additionalController,
                obscureText: false,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                borderColor: isDarkMode ? Colors.grey : Colors.black12,
                hintText: AppLocalizations.of(context)!.additional_directions,
                label: AppLocalizations.of(context)!.additional_directions,
                width: double.infinity,
                labelColor: Theme.of(context).primaryColor,
              ),
              SizedBox(height: 20.h),
              CustomButtonWidget(
                title: AppLocalizations.of(context)!.save_address,
                colors: [AppConstants.buttonColor, AppConstants.buttonColor],
                titleColor: Theme.of(context).primaryColor,
                width: double.infinity,
                borderRadius: 12.r,
                height: 60.h,
                onPressed: () {
                  if (locationController.buildingController.text.isEmpty ||
                      locationController.apartmentNumController.text.isEmpty ||
                      locationController.floorController.text.isEmpty ||
                      locationController.streetController.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          content: Text(
                            textAlign: TextAlign.center,
                            AppLocalizations.of(context)!.empty_fields,
                            style: AppStyles.getFontStyle(
                              langController,
                              fontSize: 14.sp,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          actions: [
                            CustomButtonWidget(
                              title: AppLocalizations.of(context)!.ok,
                              colors: [
                                AppConstants.buttonColor,
                                AppConstants.buttonColor,
                              ],
                              height: 60.h,
                              borderRadius: 12.r,
                              titleColor: Theme.of(context).primaryColor,
                              width: 300.w,
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => CheckOutScreen()),
                    );
                    locationController.addAddress(
                      areaName: _areaName,
                      buildingName: locationController.buildingController.text,
                      apartmentNumber:
                          locationController.apartmentNumController.text,
                      floor: locationController.floorController.text,
                      street: locationController.streetController.text,
                      additionalDirections:
                          locationController.additionalController.text,
                      location: _selectedLocation ?? LatLng(0, 0),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _fetchAreaName(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latitude,
        longitude,
      );
      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;
        setState(() {
          _areaName =
              "${placemark.locality ?? ''}, ${placemark.administrativeArea ?? ''}";
        });
      } else {
        setState(() {
          _areaName = "Unknown Area";
        });
      }
    } catch (e) {
      setState(() {
        _areaName = "Error fetching area";
      });
    }
  }

  void _fetchAreaNameFromMap() {
    final visibleRegionCenter =
        _selectedLocation ?? LatLng(31.985934703432616, 35.900362288558114);
    _fetchAreaName(visibleRegionCenter.latitude, visibleRegionCenter.longitude);
  }
}
