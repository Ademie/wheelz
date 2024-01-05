import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class UserMap extends StatelessWidget {
  const UserMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return (FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(7.302952885790951, 5.138908926692239),
        initialZoom: 15,
        maxZoom: 22.0,
        minZoom: 14.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        // CurrentLocationLayer(),
        CurrentLocationLayer(
          positionStream: const LocationMarkerDataStreamFactory()
              .fromGeolocatorPositionStream(
                  stream: Geolocator.getPositionStream(
            locationSettings: const LocationSettings(
              accuracy: LocationAccuracy.high,
              distanceFilter: 50,
              timeLimit: Duration(minutes: 1),
            ),
          )),
          style: const LocationMarkerStyle(
            marker: DefaultLocationMarker(
              child: Icon(
                Icons.navigation,
                color: Colors.white,
              ),
            ),
            markerSize: Size(40, 40),
            markerDirection: MarkerDirection.heading,
          ),
        )
      ],
    ));
  }
}
