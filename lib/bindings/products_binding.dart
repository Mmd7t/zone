import 'package:get/get.dart';
import 'package:top_zone/controllers/auth_controller.dart';
import 'package:top_zone/controllers/products_controller.dart';

class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      ProductsController(),
      permanent: true,
    );
    Get.lazyPut(() => AuthController());
  }
}
