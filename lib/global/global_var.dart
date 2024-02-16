import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
String userName = "";
String googleMapKey = "AIzaSyAkF85sNBUpejsKnDFKOeA_kVDdKX2onnU";
String userPhone = "";
String userID = FirebaseAuth.instance.currentUser!.uid;
String serverKeyFCM = "paste your key here";

// const futa = 7.257072080204182, 5.205094135707604;

const CameraPosition googlePlexInitialPosition = CameraPosition(
  target: LatLng(7.257072080204182, 5.205094135707604),
  zoom: 18,
);

StreamSubscription<Position>? positionStreamHomePage;
StreamSubscription<Position>? positionStreamNewTripPage;

int driverTripRequestTimeout = 20;

final audioPlayer = AssetsAudioPlayer();

Position? driverCurrentPosition;

String driverName = "";
String driverPhone = "";
String driverPhoto = "";
String carColor = "";
String carModel = "";
String carNumber = "";
