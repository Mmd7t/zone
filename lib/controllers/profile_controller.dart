import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:top_zone/models/vendor_edit_profile.dart';
import 'package:top_zone/routes/app_pages.dart';
import 'package:top_zone/utils/constants.dart';
import 'package:top_zone/utils/retrofit.dart';
import 'package:top_zone/utils/shared_prefs.dart';
import 'package:top_zone/widgets/custom_dialogs.dart';

class ProfileController extends GetxController {
  RestClient client = RestClient(
    Dio(
      BaseOptions(baseUrl: Constants.BASE_URL),
    ),
  );

  RxString apiToken;
  RxInt userId;
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString phone = ''.obs;
  Rx<File> image = Rx<File>(null);
  RxString ownerName = ''.obs;
  RxDouble lat = 0.0.obs;
  RxDouble long = 0.0.obs;

  RxBool editProfileLoading = RxBool(false);

  Future<void> getToken() async {
    String data = await SharedPrefsHelper.getApiTokenFromPrefs();
    if (data != null) {
      apiToken = data.obs;
    }
    print(data);
  }

  Future<void> getUserId() async {
    int data = await SharedPrefsHelper.getUserIdFromPrefs();
    if (data != null) {
      userId = data.obs;
    }
    print(data);
  }

  Future<void> vendorEditProfile() async {
    try {
      editProfileLoading.value = true;
      VendorEditProfileResponseModel response = await client.vendorEditProfile(
        userId.value,
        apiToken.value,
        name.value,
        email.value,
        ownerName.value,
        image.value,
        phone.value,
        lat.value,
        long.value,
      );
      if (response != null && response.code == 200) {
        print('dbfbefbdfbdf :: ${response.code}');
        print('dbfbefbdfbdf :: ${response.data}');
      } else {
        errorDialog(content: response.error.toString());
      }
      editProfileLoading.value = false;
    } on Exception catch (e) {
      throw e;
    }
  }
}
