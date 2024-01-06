// import 'dart:async';
// import 'dart:convert';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:wheelz/global/global_var.dart';


// class DriverHome extends StatefulWidget {
//   const DriverHome({super.key});

//   @override
//   State<DriverHome> createState() => _DriverHomeState();
// }

// class _DriverHomeState extends State<DriverHome>
// {
//   final Completer<GoogleMapController> googleMapCompleterController = Completer<GoogleMapController>();
//   GoogleMapController? controllerGoogleMap;
//   Position? currentPositionOfUser;


//   void updateMapTheme(GoogleMapController controller)
//   {
//     getJsonFileFromThemes("themes/night_style.json").then((value)=> setGoogleMapStyle(value, controller));
//   }

//   Future<String> getJsonFileFromThemes(String mapStylePath) async
//   {
//     ByteData byteData = await rootBundle.load(mapStylePath);
//     var list = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
//     return utf8.decode(list);
//   }

//   setGoogleMapStyle(String googleMapStyle, GoogleMapController controller)
//   {
//     controller.setMapStyle(googleMapStyle);
//   }

//   getCurrentLiveLocationOfDriver() async
//   {
//     Position positionOfUser = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
//     currentPositionOfUser = positionOfUser;

//     LatLng positionOfUserInLatLng = LatLng(currentPositionOfUser!.latitude, currentPositionOfUser!.longitude);

//     CameraPosition cameraPosition = CameraPosition(target: positionOfUserInLatLng, zoom: 15);
//     controllerGoogleMap!.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [

//           GoogleMap(
//             mapType: MapType.normal,
//             myLocationEnabled: true,
//             initialCameraPosition: googlePlexInitialPosition,
//             onMapCreated: (GoogleMapController mapController)
//             {
//               controllerGoogleMap = mapController;
//               updateMapTheme(controllerGoogleMap!);

//               googleMapCompleterController.complete(controllerGoogleMap);

//               getCurrentLiveLocationOfDriver();
//             },
//           ),

//         ],
//       ),
//     );
//   }
// }
