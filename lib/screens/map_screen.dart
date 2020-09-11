import 'package:flutter/material.dart';
import 'package:google_map/modals/user_input.dart';
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
  Set<Marker> _markers = Set<Marker>();

  //Position _position;
  // void _getCurrentLocation() async {
  //   _position =
  //       await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   print("location: " + _position.latitude.toString());
  //   print("location: " + _position.longitude.toString());
  // }

  void _openModal(BuildContext ctx, double latitude, double longitude) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return UserInput(latitude, longitude);
      },
    );
  }

  static final CameraPosition _myLocation = CameraPosition(
    target: LatLng(23.810331, 90.412521),
    zoom: 11.0,
  );

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    _location.onLocationChanged.listen((locationData) {
      setState(() {
        _markers.add(
          Marker(
            draggable: false,
            markerId: MarkerId("home"),
            position: LatLng(locationData.latitude, locationData.longitude),
            icon: BitmapDescriptor.defaultMarker,
            onTap: () => _openModal(
                context, locationData.latitude, locationData.longitude),
          ),
        );
      });

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
            markers: _markers,
          ),
        ],
      ),
    );
  }
}
