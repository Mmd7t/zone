import 'package:get/get.dart';
import 'package:top_zone/controllers/auth_controller.dart';
import 'package:top_zone/controllers/products_controller.dart';
import 'package:top_zone/controllers/static_controller.dart';

class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProductsController(), permanent: true);
    Get.put(StaticController(), permanent: true);
    Get.lazyPut(() => AuthController());
  }
}
