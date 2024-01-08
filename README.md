# wheelz

This is Flutter Uber Clone - Users App.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

wirekess debugging android
Connect via USB: adb tcpip 5555.
Disconnect USB, Get Phone Ip Address Settings > About Phone > Status.
Now adb connect 172.20.10.14

<!-- Map styles -->

https://mapstyle.withgoogle.com/

https://github.com/kiko-g/feup-esof/tree/master?tab=readme-ov-file

/ initPosition:
// GeoPoint(latitude: 7.3045349, longitude: 5.1294792731864955),
// areaLimit: BoundingBox(
// east: 5.1496914,
// north: 7.2928867,
// south: 5.1132238,
// west: 7.3152956,
// ),



AutoComplete
https://photon.komoot.io/api/?q=futa&lat=7.3045349&lon=5.1294792
https://www.youtube.com/watch?v=Ye312X0pQqk

ROUTING
https://www.youtube.com/watch?v=k0kDJfdPSvc
https://github.com/reussiteforever/Flutter_map_with_OpenRouteService/tree/main/lib



Here is a draft research paper on the topic "Development of a cross platform campus ride booking mobile application using flutter":

Development of a Cross Platform Campus Ride Booking Mobile Application Using Flutter

Abstract

With the proliferation of smartphones and mobile applications, there is a growing need for cross platform mobile apps that can work seamlessly on both Android and iOS devices. Flutter is a new open-source framework by Google that allows developing high-performance mobile apps for multiple platforms with a single codebase. This paper presents the development of a campus ride booking application using Flutter. The app aims to provide an easy way for students to book rides within the campus premises. The frontend UI is built using Flutter SDK while the backend uses Firebase for user authentication and ride management. Flutter's hot reload feature significantly reduced development time and enabled faster iterations. Overall, Flutter provided a positive development experience and seems promising for building cross platform mobile applications with native-like performance. The availability of readymade widgets, good documentation and an active community makes it an attractive choice for mobile developers.

Introduction

With mobile devices becoming the primary computing platform, mobile applications have become a must for all kinds of services. However, native app development for multiple platforms like iOS and Android leads to huge development overhead in terms of both time and cost. Cross platform mobile frameworks like Flutter can help reduce this overhead significantly. Flutter is Google's latest offering in this domain and promises high performance and richer experience across devices with a single codebase. 

This paper presents a case study of developing a campus ride booking application using Flutter. The app aims to provide students a quick and easy way to book rides between different points within the campus. It has features like user authentication, ride booking, driver tracking, and payment gateway integration.

About Flutter

Flutter is an open source framework by Google for building mobile applications for iOS and Android from a single Dart codebase. It provides reactive programming model and fast development cycles with its hot reload feature.

Some of the key advantages of Flutter are:

- Cross platform support - Single Dart codebase that compiles to native ARM code for both iOS and Android
- High performance - Uses Skia graphics engine and provides up to 120fps animation speed
- Hot Reload - Quick reload of code changes in just 1 second to see changes instantly
- Widgets - Provides highly customizable and reusable widgets to build native-like experiences
- Accessible APIs - Allows interaction with platform APIs and reuse existing Java/Kotlin/ObjC code
- Scalable - Modular architecture allows building simple to most complex mobile apps 
- Growing community - Being backed by Google, has an active & steadily growing developer community

Thus, Flutter makes it easy to develop high performance mobile apps for multiple platforms quickly with minimal overhead. This makes it a great choice for startups and companies looking for cross platform solutions.

Application Overview

The campus ride booking app built using Flutter has the following features:

- User authentication - Students can sign up and login using college email id. Firebase authentication is used on the backend.

- Ride booking - Students can select source and destination points within campus and book a ride. Details like ride type, capacity, fare etc are provided.

- Driver tracking - Realtime tracking of driver location after booking a ride. Students can see expected time of arrival.

- Fare management - Fare is calculated automatically based on ride type and distance. Payment happens through integrated mobile wallet. 

- Ride history - Students can view history and details of all rides booked by them.

The app provides an easy to use interface through which students can quickly book rides and navigate between campus areas. Key data like user profiles, ride history and locations are stored on Firebase.

Implementation

The campus ride app is built using Flutter SDK and uses Dart programming language. The frontend UI is constructed using Flutter widgets and Material design components. Following are some of the key widgets and components used:

- MaterialApp - Creates a Material style app shell for visual consistency 

- Scaffold - Provides basic app skeleton with app bar, body and bottom navbar

- AppBar - Displays app bar with title and actions like drawer menu

- Drawer - Declarative API to build the side menu for navigation

- TextFields - Used to take text inputs from users  

- ElevatedButton - Styled button for actions like login/signup

- ListViews - For displaying scrollable lists of data like ride history

- Google Maps - Displaying maps for selecting source/destination and driver tracking

- StreamBuilder - Widget for reactive programming and live driver tracking

Flutter's reactive framework, hot reload and rich widget set allowed quickly building an engaging UI. For backend, Firebase was integrated to handle user auth, database for ride history and cloud functions for booking rides. Key dependencies used:

- firebase_auth - For authentication and storing user profiles

- cloud_firestore - Firestore database to store ride history

- firebase_functions - Cloud functions to process ride booking requests

- google_maps_flutter - Google maps plugin for selecting locations and live tracking

- geolocator - To get current user location for booking rides

Overall, Flutter provided a great development experience with fast UI construction and easy integration with native platform capabilities like maps, location, camera etc.

Results and Analysis

The campus ride booking application was built in approximately 5 weeks by a single developer. The developer had prior experience in Android development but was new to Flutter framework. Following are some observations during the development:

- Flutter's hot reload helped iterate quickly over UI changes and see the results immediately. Tweaking UI and styles was very fast.

- Dart language was easy to learn coming from Java/Kotlin background and provided great support for asynchronous code.

- Availability of customizable widgets like ListView, Drawer etc removed the need to build basic components from scratch.

- Interaction with platform layers like Google Maps, Camera etc was smooth. The plugins matured over the development duration.

- State management using reactive frameworks like Streams and BLoC pattern worked well for live tracking and booking flows.

- Building and integrating cloud functions for booking logic was simple using Firebase.

Overall the application was built faster than native apps and provided a slick experience. The compile times were a bit longer during initial stages but improved as the framework seemed to optimize over time. The app is currently undergoing closed beta testing before public release.

Conclusion

Flutter proved to be an excellent choice for building a cross platform campus ride booking app with a fluid user experience. Features like hot reload, reactive framework and rich widget set enabled quick turnaround over UI changes and development iterations. Dart language made it easy to get started and build complex asynchronous flows. Integration with Firebase for backend needs was simple and very effective.

While the framework is still in its early stages, it has great potential for developing high quality mobile apps for multiple platforms with a single codebase. Performance and visual experience of the app was at par with native apps. Flutter's growing community and plugin ecosystem make it easy to get started. Overall it provides a modern development framework for building mobile apps of the future.








if (appInfo.pickUpLocation == null) {
          // || appInfo.dropOffLocation == null

          return Container(
            child: Text('No pickup'),
          );
          // return FlutterMap(
          //   mapController: widget.mapController,
          //   options: MapOptions(
          //     center: const LatLng(7.302952885790951, 5.138908926692239),
          //     zoom: 15.0,
          //     maxZoom: 22.0,
          //     minZoom: 14.0,
          //   ),
          //   children: [
          //     TileLayer(
          //       urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          //       userAgentPackageName: 'com.example.app',
          //     ),
          //     CurrentLocationLayer(
          //       positionStream: const LocationMarkerDataStreamFactory()
          //           .fromGeolocatorPositionStream(
          //               stream: Geolocator.getPositionStream(
          //         locationSettings: const LocationSettings(
          //           accuracy: LocationAccuracy.high,
          //           distanceFilter: 50,
          //           timeLimit: Duration(minutes: 1),
          //         ),
          //       )),
          //       style: const LocationMarkerStyle(
          //         marker: DefaultLocationMarker(
          //           child: Icon(
          //             Icons.navigation,
          //             color: Colors.white,
          //           ),
          //         ),
          //         markerSize: Size(40, 40),
          //         markerDirection: MarkerDirection.heading,
          //       ),
          //     )
          //   ],
          // );
        }

        pickUplat = appInfo.pickUpLocation!.latitudePosition;
        pickUplong = appInfo.pickUpLocation!.longitudePosition;
        dropOfflat = appInfo.dropOffLocation!.latitudePosition;
        dropOfflong = appInfo.dropOffLocation!.longitudePosition;


        ///Place Details - Places API
  // fetchClickedPlaceDetails(String placeID) async {
  //   showDialog(
  //     barrierDismissible: false,
  //     context: context,
  //     builder: (BuildContext context) =>
  //         LoadingDialog(messageText: "Getting details..."),
  //   );

  //   String urlPlaceDetailsAPI =
  //       "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeID&key=$googleMapKey";

  //   var responseFromPlaceDetailsAPI =
  //       await CommonMethods.sendRequestToAPI(urlPlaceDetailsAPI);

  //   Navigator.pop(context);

  //   if (responseFromPlaceDetailsAPI == "error") {
  //     return;
  //   }

  //   if (responseFromPlaceDetailsAPI["status"] == "OK") {
  //     AddressModel dropOffLocation = AddressModel();
  //     // print("place ${place["geometry"]["coordinates"]}");

  //     dropOffLocation.placeName = responseFromPlaceDetailsAPI["result"]["name"];
  //     dropOffLocation.latitudePosition =
  //         responseFromPlaceDetailsAPI["result"]["geometry"]["coordinates"][0];
  //     dropOffLocation.longitudePosition =
  //         responseFromPlaceDetailsAPI["result"]["geometry"]["coordinates"][1];
  //     print(
  //         'llla ${dropOffLocation.longitudePosition = responseFromPlaceDetailsAPI["result"]["geometry"]["coordinates"][1]}');
  //     // dropOffLocation.latitudePosition =
  //     //     responseFromPlaceDetailsAPI["result"]["geometry"]["location"]["lat"];
  //     // dropOffLocation.longitudePosition =
  //     //     responseFromPlaceDetailsAPI["result"]["geometry"]["location"]["lng"];
  //     dropOffLocation.placeID = placeID;

  //     Provider.of<AppInfo>(context, listen: false)
  //         .updateDropOffLocation(dropOffLocation);

  //     Navigator.pop(context, "placeSelected");
  //   }
  // }