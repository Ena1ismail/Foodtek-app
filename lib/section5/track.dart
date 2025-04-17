import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/controller/check_out_controller.dart';
import 'package:foodtek/section5/chat_page.dart';
import 'package:foodtek/section5/search.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../app_styles.dart';
import '../controller/lang_controller.dart';
import '../l10n/app_localizations.dart';
import 'order_details.dart';
import 'profile1.dart';
import 'OrderTrack_widget.dart';
import 'alexander.dart';

class TrackPage extends StatefulWidget {
  const TrackPage({super.key});

  @override
  State<TrackPage> createState() => _TrackPageState();
}

class _TrackPageState extends State<TrackPage> {
  LatLng sourceDes = LatLng(37.33500926, -122.03272188);
  LatLng destination = LatLng(37.33429383, -122.06600055);
  LatLng carPosition = LatLng(37.33382, -122.0498);

  List<LatLng> polyLineCoordinatesFromResturant = [];
  List<LatLng> polyLineCoordinatesToHome = [];
  String googleApiKey = "YOUR_GOOGLE_MAPS_API_KEY";

  void getPolyPointsFromResturant() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: googleApiKey,
      request: PolylineRequest(
        origin: PointLatLng(sourceDes.latitude, sourceDes.longitude),
        destination: PointLatLng(carPosition.latitude, carPosition.longitude),
        mode: TravelMode.driving,
      ),
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polyLineCoordinatesFromResturant.add(
          LatLng(point.latitude, point.longitude),
        );
      }
    } else {
      print(AppLocalizations.of(context)!.no_points_found_in_polyline_result);
    }
    setState(() {});
  }

  void getPolyPointsToHome() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: googleApiKey,
      request: PolylineRequest(
        origin: PointLatLng(carPosition.latitude, carPosition.longitude),
        destination: PointLatLng(destination.latitude, destination.longitude),
        mode: TravelMode.driving,
      ),
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polyLineCoordinatesToHome.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      print(AppLocalizations.of(context)!.no_points_found_in_polyline_result);
    }
    setState(() {});
  }

  Set<Marker> markers = {};

  getCustomIconMarker() async {
    final BitmapDescriptor homeIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(30, 30)),
      "assets/images/homelogo.png",
    );
    final BitmapDescriptor carIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      "assets/images/car.png",
    );
    final BitmapDescriptor resturantIcon =
    await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      "assets/images/resturantLogo.png",
    );

    markers.addAll({
      Marker(
        icon: homeIcon,
        markerId: MarkerId("initial Location"),
        position: sourceDes,
      ),
      Marker(
        zIndex: 10,
        infoWindow: InfoWindow(title: "hello world", snippet: "distance"),
        icon: carIcon,
        markerId: MarkerId("car Location"),
        position: carPosition,
      ),
      Marker(
        icon: resturantIcon,
        markerId: MarkerId("second Location"),
        position: destination,
      ),
    });
    setState(() {});
  }

  @override
  void initState() {
    getPolyPointsFromResturant();
    getPolyPointsToHome();
    getCustomIconMarker();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Consumer<CheckOutController>(
      builder: (context, checkOutController, child) {
        if (checkOutController.isChatScreen) {
          return ChatPage();
        } else if (checkOutController.isAllDetailsScreen) {
          return OrderDetailsScreen();
        } else {
          return Scaffold(
            body: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: sourceDes,
                    zoom: 13.5,
                  ),
                  markers: markers,
                  polylines: {
                    Polyline(
                      width: 2,
                      polylineId: PolylineId("route"),
                      points: polyLineCoordinatesFromResturant,
                      color: Color(0xff25AE4B),
                    ),
                    Polyline(
                      width: 2,
                      polylineId: PolylineId("route2"),
                      points: polyLineCoordinatesToHome,
                      color: Colors.black,
                    ),
                  },
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SearchScreen(),
                ),

                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 21, vertical: 28),
                    height: 300.h,
                    width: 432.w,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.on_the_way,
                                style: AppStyles.getFontStyle(
                                  langController,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Color(0xff25AE4B),
                                ),
                                onPressed: () {
                                  checkOutController.toggleAllDetailsScreen();
                                },
                                child: Text(
                                  AppLocalizations.of(context)!.all_details,
                                  style: AppStyles.getFontStyle(
                                    langController,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Row(
                            spacing: 10.w,
                            children: [
                              Expanded(
                                child: OrderTrackStatusWidget(
                                  title:
                                  AppLocalizations.of(
                                    context,
                                  )!.order_placed,
                                  value: 1,
                                ),
                              ),
                              Expanded(
                                child: OrderTrackStatusWidget(
                                  title:
                                  AppLocalizations.of(context)!.on_the_way,
                                ),
                              ),
                              Expanded(
                                child: OrderTrackStatusWidget(
                                  title:
                                  AppLocalizations.of(context)!.delivered,
                                  value: 0,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Alexander(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}