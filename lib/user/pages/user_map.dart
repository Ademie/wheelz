import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:wheelz/global/api.dart';
import 'package:wheelz/global/singleton.dart';
import 'package:wheelz/user/appInfo/app_info.dart';
import 'package:wheelz/user/models/address_model.dart';

class UserMap extends StatefulWidget {
  const UserMap({
    Key? key,
    this.mapController,
  }) : super(key: key);

  final MapController? mapController;

  @override
  State<UserMap> createState() => _UserMapState();
}

class _UserMapState extends State<UserMap> {
  List<List<double>> listOfPoints = [];
  List<LatLng> points = [];
  double? pickUplat;
  double? pickUplong;
  double? dropOfflat;
  double? dropOfflong;
//       "7.304738551053932,5.1322251037035915", '5.1438056,7.3015219'
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AddressModel? dropOff = Singleton().dropOff;
    AppInfo appInfo = Provider.of<AppInfo>(context);
    AddressModel? pickupLocation = appInfo.pickUpLocation;

    if (pickupLocation != null && dropOff != null) {
      getCoordinates() async {
        var response = await http.get(getRouteUrl(
            "${pickupLocation.longitudePosition}, ${pickupLocation.latitudePosition}",
            "${dropOff.latitudePosition}, ${dropOff.longitudePosition}"));

        setState(() {
          if (response.statusCode == 200) {
            var data = jsonDecode(response.body);
            listOfPoints = data['features'][0]['geometry']['coordinates'];
            points = listOfPoints
                .map((p) => LatLng(p[1].toDouble(), p[0].toDouble()))
                .toList();
          } else {
            // Handle the case when there is no successful response (e.g., display an error message)
            print("Error: ${response.statusCode}");
          }
        });

        print("pooo $points");
      }

      return FlutterMap(
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
              Marker(
                point: LatLng(
                  pickupLocation.latitudePosition!,
                  pickupLocation.longitudePosition!,
                ),
                width: 80,
                height: 80,
                builder: (context) => IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.location_on),
                  color: Colors.blue,
                  iconSize: 45,
                ),
              ),
              Marker(
                point: LatLng(
                  // 5.1398085, 7.3021092
                  // 7.3046773850207085,
                  // 5.1389089266922
                  dropOff.longitudePosition!,
                  dropOff.latitudePosition!,
                ),
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
          PolylineLayer(
            polylineCulling: false,
            polylines: [
              Polyline(
                points: points,
                color: Colors.blue,
                strokeWidth: 5,
              ),
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
              ),
            ),
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
          ),
          Positioned(
            top: 40,
            right: 40,
            child: ElevatedButton(
              onPressed: () {
                getCoordinates;
              },
              child: Text('Go'),
            ),
          ),
        ],
      );
    }

    return FlutterMap(
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
        CurrentLocationLayer(
          positionStream: const LocationMarkerDataStreamFactory()
              .fromGeolocatorPositionStream(
            stream: Geolocator.getPositionStream(
              locationSettings: const LocationSettings(
                accuracy: LocationAccuracy.high,
                distanceFilter: 50,
                timeLimit: Duration(minutes: 1),
              ),
            ),
          ),
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
        ),
      ],
    );
  }
}
