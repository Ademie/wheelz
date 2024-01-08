import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wheelz/user/models/address_model.dart';

class AppInfo extends ChangeNotifier {
  AddressModel? pickUpLocation;
  AddressModel? dropOffLocation;
  double? latitude;
  double? longitude;

  Future<void> updatePickUpLocationWithCurrentLocation() async {
    try {
      // Get the current position of the user
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation,
      );

      // Create a new AddressModel using the user's current location
      AddressModel currentLocation = AddressModel(
        latitudePosition: position.latitude,
        longitudePosition: position.longitude,
        placeName: 'Current Location', // You can set a custom name if needed
      );

      // Update the pickup location with the current location
      updatePickUpLocation(currentLocation);
    } catch (e) {
      print('Error fetching current location: $e');
    }
  }

  void updatePickUpLocation(AddressModel pickUpModel) {
    pickUpLocation = pickUpModel;
    notifyListeners();
  }

  void updateDropOffLocation(AddressModel dropOffModel) {
    dropOffLocation = dropOffModel;
    notifyListeners();
  }
}

