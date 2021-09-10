import 'package:get/get.dart';
import 'package:top_zone/controllers/geolocator_controller.dart';

class GoogleMapBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GeolocatorController(), permanent: true);
  }
}
