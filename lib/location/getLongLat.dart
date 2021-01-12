
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationApp extends StatefulWidget {
  @override
  _LocationAppState createState() => _LocationAppState();
}

class _LocationAppState extends State<LocationApp> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;
  
  var locationMessage = " ";

  void getCurrentLocation() async {
    var position =  await Geolocator
    .getCurrentPosition();
    var lastposition =  await Geolocator
    .getLastKnownPosition();
    
    print(lastposition);
    setState(() {
      locationMessage = "Longitude => ${position.longitude} | Latitude => ${position.latitude}";
    });

    LatLng latLng = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPositon = new CameraPosition(
      target:latLng, zoom: 14);

    newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPositon));

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.location_on,
            size: 46.0,
            color: Colors.blue,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Get User Location",
            style: TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(""),
          FlatButton(
            onPressed: () {
              getCurrentLocation();
            },
            child: Text(
              "Get Current Location",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
          )
        ],
      ),
    ));
  }
}
