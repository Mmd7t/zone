import 'package:get/get.dart' show GetPage;
import 'package:top_zone/bindings/auth_binding.dart';
import 'package:top_zone/bindings/google_map_binding.dart';
import 'package:top_zone/bindings/products_binding.dart';
import 'package:top_zone/bindings/profile_binding.dart';
import 'package:top_zone/pages/auth/verify_phone_page.dart';
import 'package:top_zone/pages/menu_page/settings/setting_page.dart';
import 'package:top_zone/pages/menu_page/settings/setting_pages/edit_profile_page.dart';
import 'package:top_zone/pages/product_pages/add_product/add_product1.dart';
import 'package:top_zone/pages/product_pages/add_product/add_product2.dart';
import 'package:top_zone/pages/product_pages/add_product/add_product3.dart';
import 'package:top_zone/pages/static_pages/static_page.dart';
import '../pages/auth/login_page.dart';
import '../pages/auth/register_intro.dart';
import '../pages/auth/signup1.dart';
import '../pages/auth/signup2.dart';
import '../pages/auth/signup3.dart';
import '../pages/main_page.dart';
import '../pages/onboarding/onboarding.dart';
import '../pages/product_pages/product_details/product_details.dart';
import '../pages/splash_screen.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.ROOT;

  static final routes = [
    GetPage(
      name: Routes.ROOT,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => OnBoarding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.MAIN_PAGE,
      page: () => MainPage(),
      binding: ProductsBinding(),
    ),
    GetPage(
      name: Routes.REGISTER_INTRO,
      page: () => RegisterIntro(),
    ),
    GetPage(
      name: Routes.REGISTER1,
      page: () => SignupPage1(),
      binding: GoogleMapBinding(),
    ),
    GetPage(
      name: Routes.REGISTER2,
      page: () => SignupPage2(),
    ),
    GetPage(
      name: Routes.REGISTER3,
      page: () => SignupPage3(),
    ),
    GetPage(
      name: Routes.VERIFY_PHONE,
      page: () => VerifyPhonePage(),
    ),
    GetPage(
      name: Routes.ADD_PRODUCT1,
      page: () => AddProduct1(),
    ),
    GetPage(
      name: Routes.ADD_PRODUCT2,
      page: () => AddProduct2(),
    ),
    GetPage(
      name: Routes.ADD_PRODUCT3,
      page: () => AddProduct3(),
    ),
    GetPage(
      name: Routes.PRODUCT_DETAILS,
      page: () => ProductDetails(),
    ),
    GetPage(
      name: Routes.STATIC_PAGE,
      page: () => StaticPage(),
    ),
    GetPage(
      name: Routes.EDIT_PROFILE,
      page: () => EditProfilePage(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => SettingPage(),
      binding: ProfileBinding(),
    ),
  ];
}
