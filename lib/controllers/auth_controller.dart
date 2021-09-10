import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:top_zone/models/auth_model.dart';
import 'package:top_zone/models/verify_code_model.dart';
import 'package:top_zone/routes/app_pages.dart';
import 'package:top_zone/utils/constants.dart';
import 'package:top_zone/utils/retrofit.dart';
import 'package:top_zone/utils/shared_prefs.dart';
import 'package:top_zone/widgets/custom_dialogs.dart';

class AuthController extends GetxController {
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
  RxString password = ''.obs;
  Rx<File> file = Rx<File>(null);

  RxBool loginLoading = RxBool(false);
  RxBool registerLoading = RxBool(false);
  RxBool verifyLoading = RxBool(false);

  void saveToken(String token) {
    apiToken = token.obs;
    SharedPrefsHelper.saveApiKeyToPrefs(apiToken.value);
  }

  Future<void> getToken() async {
    String data = await SharedPrefsHelper.getApiTokenFromPrefs();
    if (data != null) {
      apiToken = data.obs;
    }
    print(data);
  }

  void saveUserId(int id) {
    userId = id.obs;
    SharedPrefsHelper.saveUserIdToPrefs(userId.value);
  }

  Future<void> getUserId() async {
    int data = await SharedPrefsHelper.getUserIdFromPrefs();
    if (data != null) {
      userId = data.obs;
    }
    print(data);
  }

  removeToken() async {
    await SharedPrefsHelper.removeToken();
    apiToken = null;
  }

  removeUserId() async {
    await SharedPrefsHelper.removeToken();
    userId = null;
  }

/*--------------------------------------------------------------------------------------*/
/*----------------------------------  Login Function  ----------------------------------*/
/*--------------------------------------------------------------------------------------*/

  Future<void> login(LoginModel loginModel) async {
    try {
      loginLoading.value = true;
      LoginResponseModel response = await client.postLogin(loginModel.toJson());
      if (response != null && response.code == 200) {
        saveToken(response.data.apiToken);
        saveUserId(response.data.id);
        print('Tokkkkkkkkkken :: ${response.data.apiToken}');
        print('iddddddddddddd :: ${response.data.id}');
        Get.offNamedUntil(Routes.MAIN_PAGE, (route) => false);
      } else {
        errorDialog(content: response.error.toString());
      }
      loginLoading.value = false;
    } catch (e) {
      // errorDialog(content: 'حدث خطأ\nمن فضلك اعد المحاولة مرة اخرى');
      throw e;
    }
  }

/*--------------------------------------------------------------------------------------*/
/*----------------------------------  Signup Function  ---------------------------------*/
/*--------------------------------------------------------------------------------------*/

  Future<void> register(RegisterModel registerModel) async {
    try {
      registerLoading.value = true;
      RegisterResponseModel response = await client.postRegister(
          file.value,
          name.value,
          email.value,
          phone.value,
          password.value,
          registerModel.len,
          registerModel.alt);
      if (response != null && response.code == 200) {
        print('dbfbefbdfbdf :: ${response.code}');
        print('dbfbefbdfbdf :: ${response.data}');
        print('dbfbefbdfbdf :: ${response.phoneVerify}');
        Get.toNamed(Routes.VERIFY_PHONE, arguments: registerModel.phone);
      } else {
        errorDialog(content: response.error.toString());
      }
      registerLoading.value = false;
    } catch (e) {
      throw e;
    }
  }

  Future<void> verifyCode(VerifyCodeModel verifyCodeModel) async {
    try {
      verifyLoading.value = true;
      VerifyCodeResponseModel response =
          await client.postVerifyCode(verifyCodeModel.toJson());
      if (response != null && response.code == 200) {
        saveToken(response.token);
        saveUserId(response.data.id);
        print('Tokkkkkkkkkken :: ${response.token}');
        print('iddddddddddddd :: ${response.data.id}');
        Get.offNamedUntil(Routes.MAIN_PAGE, (route) => false);
      } else {
        errorDialog(content: response.error.toString());
      }
      verifyLoading.value = false;
    } catch (e) {
      throw e;
    }
  }

  /*--------------------------------------------------------------------------------------*/
  /*--------------------------------------  Log out  -------------------------------------*/
  /*--------------------------------------------------------------------------------------*/

  logout() async {
    await removeToken();
    await removeUserId();

    print('token ::::: $apiToken');
    print('userId ::::: $userId');

    Get.offNamedUntil(Routes.LOGIN, (route) => false);
  }
}
