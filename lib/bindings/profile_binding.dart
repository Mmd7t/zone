import 'package:get/get.dart';
import 'package:top_zone/controllers/geolocator_controller.dart';
import 'package:top_zone/controllers/profile_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController(), permanent: true);
    Get.put(GeolocatorController(), permanent: true);
    print('Profile Binding Beginnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnns');
  }
}
