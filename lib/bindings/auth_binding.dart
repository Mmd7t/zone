import 'package:get/get.dart';
import 'package:top_zone/controllers/auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}
