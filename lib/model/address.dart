import 'package:google_maps_flutter/google_maps_flutter.dart';

class Address {
  final String areaName;
  final String buildingName;
  final String apartmentNumber;
  final String floor;
  final String street;
  final String additionalDirections;
  final LatLng location;

  Address({
    required this.areaName,
    required this.buildingName,
    required this.apartmentNumber,
    required this.floor,
    required this.street,
    required this.additionalDirections,
    required this.location,
  });
}