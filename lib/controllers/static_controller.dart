import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:top_zone/models/aboutus_model.dart';
import 'package:top_zone/utils/constants.dart';
import 'package:top_zone/utils/retrofit.dart';
import 'package:top_zone/widgets/custom_dialogs.dart';

class StaticController extends GetxController {
  RestClient client = RestClient(
    Dio(
      BaseOptions(baseUrl: Constants.BASE_URL),
    ),
  );
  RxBool aboutUsLoading = RxBool(false);

  RxList<AboutUsDatum> aboutUsDatum = <AboutUsDatum>[].obs;

  getStaticData(isAboutUsPage) async {
    aboutUsLoading.value = true;
    AboutUsModel response;
    if (isAboutUsPage) {
      response = await client.getAboutUs();
    } else {
      response = await client.getWarrantyPolicy();
    }

    if (response != null && response.code == 200) {
      aboutUsDatum.addAll(response.data);
    } else {
      errorDialog(content: 'حدث خطأ غير متوقع');
    }
    aboutUsLoading.value = false;
  }
}
