import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:wheelz/global/global_var.dart';


class UserMap extends StatefulWidget {
  const UserMap({
    super.key,
    this.mapController,
  });

  final MapController? mapController;

  @override
  State<UserMap> createState() => _UserMapState();
}

class _UserMapState extends State<UserMap> {
  List listOfPoints = [];
  List<LatLng> points = [];
  double? latitude;
  double? longitude;

  // Method to consume the OpenRouteService API
  getCoordinates() async {
    var response = await http.get(getRouteUrl(
        "1.243344,6.145332", '1.2160116523406839,6.125231015668568'));
    setState(() {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        listOfPoints = data['features'][0]['geometry']['coordinates'];
        points = listOfPoints
            .map((p) => LatLng(p[1].toDouble(), p[0].toDouble()))
            .toList();
      }
    });
  }

  // get location of user
  Future<LatLng> getCurrentLiveLocationOfUser() async {
    Position? positionOfUser;
    if (defaultTargetPlatform == TargetPlatform.android) {
      positionOfUser = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      positionOfUser = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }
    double latitude = positionOfUser!.latitude;
    double longitude = positionOfUser.longitude;
    return LatLng(latitude, longitude);
  }

  @override
  void initState() {
    super.initState();
    getCoordinates();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LatLng>(
        future: getCurrentLiveLocationOfUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          } else {
            return (FlutterMap(
              mapController: widget.mapController,
              options: MapOptions(
                center: const LatLng(7.302952885790951, 5.138908926692239),
                zoom: 15.0,
                maxZoom: 22.0,
                minZoom: 14.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: [
                    // First Marker
                    Marker(
                      point: snapshot.data!,
                      // point: const LatLng(7.31295288, 5.1389089266),
                      width: 80,
                      height: 80,
                      builder: (context) => IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.location_on),
                        color: Colors.purpleAccent,
                        iconSize: 45,
                      ),
                    ),
                    // Second Marker
                    Marker(
                      point: const LatLng(7.3029528857, 5.13890892669),
                      width: 80,
                      height: 80,
                      builder: (context) => IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.location_on),
                        color: Colors.red,
                        iconSize: 45,
                      ),
                    ),
                  ],
                ),
                // Polylines layer
                PolylineLayer(
                  polylineCulling: false,
                  polylines: [
                    Polyline(
                        points: points, color: Colors.yellow, strokeWidth: 10),
                  ],
                ),
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
        });
  }
}
