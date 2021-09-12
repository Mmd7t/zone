import 'package:get/get.dart';
import 'package:top_zone/controllers/profile_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController(), permanent: true);
  }
}
