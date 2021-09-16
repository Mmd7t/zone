import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:top_zone/models/get_user_data.dart';
import 'package:top_zone/models/vendor_edit_profile.dart';
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
  Rx<File> image = Rx<File>(null);
  RxString ownerName = ''.obs;
  RxDouble lat = 0.0.obs;
  RxDouble long = 0.0.obs;

  RxBool editProfileLoading = RxBool(false);

  onInit() {
    super.onInit();
    here();
    vendorProfileData();
  }

  here() async {
    await getToken();
    await getUserId();
  }

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
        lat.value,
        long.value,
      );
      if (response != null && response.code == 200) {
        Get.back();
        customSnackBar(
            'تم تعديل بيانات المستخدم بنجاح', CupertinoIcons.checkmark_seal);
      } else {
        errorDialog(content: response.error.toString());
      }
      editProfileLoading.value = false;
    } on DioError catch (e) {
      errorDialog(content: e.response.statusMessage.toString());
    }
  }

  RxBool vendorProfileLoading = RxBool(false);
  Rx<GetUserDataModel> getUser = GetUserDataModel().obs;
  vendorProfileData() async {
    try {
      vendorProfileLoading.value = true;

      GetUserDataModel response =
          await client.getUserData(userId.value, apiToken.value);

      if (response.code == 200 && response != null) {
        getUser.value = response;
      }
    } on DioError catch (e) {
      print(e.response.statusMessage);
      errorDialog(content: e.response.statusMessage.toString());
    }
  }
}
