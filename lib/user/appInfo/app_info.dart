import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wheelz/user/models/address_model.dart';

class AppInfo extends ChangeNotifier {
  AddressModel? pickUpLocation;
  AddressModel? dropOffLocation;
  Position? currentPositionOfUser;
  void updatePickUpLocation(AddressModel pickUpModel) {
    pickUpLocation = pickUpModel;
    notifyListeners();
  }

  void updateDropOffLocation(AddressModel dropOffModel) {
    dropOffLocation = dropOffModel;
    notifyListeners();
  }
}
