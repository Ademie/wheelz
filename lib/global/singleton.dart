import 'package:geolocator/geolocator.dart';
import 'package:wheelz/user/models/address_model.dart';

class Singleton {
  static final Singleton _singleton = Singleton._internal();
  Position? pickUp;
  AddressModel? dropOff;

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}
