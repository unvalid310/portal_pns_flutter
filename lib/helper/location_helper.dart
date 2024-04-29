import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationHelper {
  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text(
      //         'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      //     content: Text(
      //         'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<String> getAddressFromLatLng({required Position position}) async {
    final _currentAddress = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
      localeIdentifier: 'id_ID',
    ).then((List<Placemark> placemarks) {
      final place = placemarks[0];
      return '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}';
    });

    return _currentAddress;
  }

  static Future<Set<Marker>> updateMarker(double lat, double lng) async {
    Set<Marker> _markers = {};
    _markers.clear();
    _markers.add(
      Marker(
        markerId: MarkerId("myLocation"),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(title: "My Location"),
      ),
    );
    return _markers;
  }
}
