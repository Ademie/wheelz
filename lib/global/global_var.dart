import 'package:firebase_auth/firebase_auth.dart';
String userName = "";
String googleMapKey = "AIzaSyAkF85sNBUpejsKnDFKOeA_kVDdKX2onnU";
String userPhone = "";
String userID = FirebaseAuth.instance.currentUser!.uid;
String serverKeyFCM = "paste your key here";

// const futa = 7.257072080204182, 5.205094135707604;


// ROUTING
const String baseUrl = 'https://api.openrouteservice.org/v2/directions/driving-car';
const String apiKey = '5b3ce3597851110001cf6248f55d7a31499e40848c6848d7de8fa624';

getRouteUrl(String startPoint, String endPoint){
  return Uri.parse('$baseUrl?api_key=$apiKey&start=$startPoint&end=$endPoint');
}