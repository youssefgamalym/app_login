import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyGoogleMap extends StatefulWidget {
  @override
  _MyGoogleMapState createState() => _MyGoogleMapState();
}

LatLng location = LatLng(30.0056062, 31.2169988);
//Marker UserHome = MarkerID("")

class _MyGoogleMapState extends State<MyGoogleMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.satellite,
        markers: {UserHome,} ,
        initialCameraPosition: CameraPosition(target: location, zoom: 15),
      ),
    );
  }
}
