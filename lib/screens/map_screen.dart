import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController _mapController;
  Location _location = Location();
  //Position _position;

  // void _getCurrentLocation() async {
  //   _position =
  //       await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   print("location: " + _position.latitude.toString());
  //   print("location: " + _position.longitude.toString());
  // }

  static final CameraPosition _myLocation = CameraPosition(
    target: LatLng(37.4219983, -122.084),
    zoom: 11.0,
  );

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _location.onLocationChanged.listen((locationData) {
      _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(locationData.latitude, locationData.longitude),
            zoom: 11.0,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: _myLocation,
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
          ),
        ],
      ),
    );
  }
}
