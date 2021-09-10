import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:top_zone/services/geolocator_service.dart';

class GeolocatorController extends GetxController {
  final geolocatorService = GeolocatorService();

  Rx<Position> currentLocation = Position(
    longitude: 0.0,
    latitude: 0.0,
    timestamp: DateTime.now(),
    accuracy: 0.0,
    altitude: 0.0,
    heading: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
  ).obs;

  RxString getAddressName = ''.obs;

  @override
  void onInit() {
    setCurrentLocation();
    getPlaceMark();
    super.onInit();
  }

  setCurrentLocation() async {
    currentLocation.value = await geolocatorService.getCurrentLocation();
    print('a7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    await getPlaceMark();
  }

  setManualLocation(LatLng latlng) async {
    currentLocation.value = Position(
      longitude: latlng.longitude,
      latitude: latlng.latitude,
      timestamp: DateTime.now(),
      accuracy: 0.0,
      altitude: 0.0,
      heading: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
    );
    print('a7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    await getPlaceMark();
  }

  Future<void> getPlaceMark() async {
    List<Placemark> placemarks;
    try {
      // await setCurrentLocation();
      placemarks = await placemarkFromCoordinates(
          currentLocation.value.latitude, currentLocation.value.longitude);

      getAddressName.value = placemarks[0].street;
      print('oooooooooooooooooooooooooooooooooooooooooooops!!!!!');
      print('your Locaaaaaation :: $getAddressName');
    } catch (e) {
      placemarks = [
        Placemark(locality: 'لا يوجد عنوان'),
      ];
    }
  }
}
