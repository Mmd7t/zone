import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:top_zone/models/add_product_response_model.dart';
import 'package:top_zone/models/assets_model.dart';
import 'package:top_zone/models/brands_model.dart';
import 'package:top_zone/models/categories_model.dart';
import 'package:top_zone/models/product_details_model.dart';
import 'package:top_zone/models/vendor_products_model.dart';
import 'package:top_zone/routes/app_pages.dart';
import 'package:top_zone/utils/constants.dart';
import 'package:top_zone/utils/retrofit.dart';
import 'package:top_zone/utils/shared_prefs.dart';
import 'package:top_zone/widgets/custom_dialogs.dart';

class ProductsController extends GetxController {
  RestClient client = RestClient(
    Dio(
      BaseOptions(baseUrl: Constants.BASE_URL),
    ),
  );

  RxInt userId = RxInt(0);
  RxString apiToken = ''.obs;
  RxInt brandId = 0.obs;
  RxString name = ''.obs;
  RxInt category = 0.obs;
  RxInt brand = 0.obs;
  RxInt asset = 0.obs;
  RxInt mod = 0.obs;
  RxList<int> brands = <int>[].obs;
  RxList<int> assets = <int>[].obs;
  RxList<int> models = <int>[].obs;
  RxList<File> images = <File>[].obs;
  Rx<File> photo = Rx<File>(null);
  Rx<File> descphoto = Rx<File>(null);
  RxDouble price = 0.0.obs;
  RxInt productNumber = 0.obs;
  RxInt productWarranty = 0.obs;
  RxInt productCondition = 0.obs;
  RxInt amount = 0.obs;
  RxString details = ''.obs;
  RxInt carType = 0.obs;

  RxList<ProductsDatum> productsDatum = <ProductsDatum>[].obs;
  RxList<ProductDetailsDatum> productDetailsDatum = <ProductDetailsDatum>[].obs;

  RxList<CategoriesDatum> categoriesDatumList = <CategoriesDatum>[].obs;

  RxBool productDetailsLoading = RxBool(false);
  RxBool productsLoading = RxBool(false);
  RxBool addProductLoading = RxBool(false);

  Future<void> getUserId() async {
    int data = await SharedPrefsHelper.getUserIdFromPrefs();
    if (data != null) {
      userId = data.obs;
    }
    print(data);
  }

  Future<void> getApiToken() async {
    String data = await SharedPrefsHelper.getApiTokenFromPrefs();
    if (data != null) {
      apiToken = data.obs;
    }
    print(data);
  }

  @override
  void onInit() {
    super.onInit();
    getVendorProducts();
  }

  getVendorProducts() async {
    try {
      productsLoading.value = true;
      await getUserId();
      VendorProductsModel response =
          await client.getVendorProducts(userId.value);

      print('get it');
      if (response != null && response.statusCode == "200") {
        productsDatum.addAll(response.data);
        print('saved it');
        productsLoading.value = false;
      }
    } on Exception catch (e) {
      throw e;
    }
  }

  Future<CategoriesModel> getProductCategories() async {
    try {
      productDetailsLoading.value = true;
      CategoriesModel response = await client.getCategories();
      if (response != null) {
        categoriesDatumList.clear();
        categoriesDatumList.addAll(response.data);
        return response;
      } else {
        errorDialog(content: response.error.toString());
        return null;
      }
      // productDetailsLoading.value = false;
    } catch (e) {
      throw e;
    }
  }

  Future<List<BrandsModel>> getProductbrands() async {
    try {
      productDetailsLoading.value = true;
      List<BrandsModel> response = await client.getBrands();
      if (response != null) {
        // categoriesDatumList.clear();
        // categoriesDatumList.addAll(response.data);
        return response;
      } else {
        // errorDialog(content: response.toString());
        return null;
      }
      // productDetailsLoading.value = false;
    } catch (e) {
      throw e;
    }
  }

  Future<AssetsModel> getProductassets() async {
    try {
      productDetailsLoading.value = true;
      AssetsModel response = await client.getAssets(brandId.value);
      if (response != null) {
        // categoriesDatumList.clear();
        // categoriesDatumList.addAll(response.data);
        return response;
      } else {
        // errorDialog(content: response.toString());
        return null;
      }
      // productDetailsLoading.value = false;
    } catch (e) {
      throw e;
    }
  }

  Future<AssetsModel> getProductassets2(id) async {
    try {
      productDetailsLoading.value = true;
      AssetsModel response = await client.getAssets(id);
      if (response != null) {
        // categoriesDatumList.clear();
        // categoriesDatumList.addAll(response.data);
        return response;
      } else {
        // errorDialog(content: response.toString());
        return null;
      }
      // productDetailsLoading.value = false;
    } catch (e) {
      throw e;
    }
  }

  Future<void> addProduct() async {
    AddProductResponseModel response;
    try {
      addProductLoading.value = true;
      await getApiToken();
      response = await client.addProduct(
        userId.value,
        apiToken.value,
        name.value,
        photo.value,
        images,
        price.value,
        productNumber.value,
        productCondition.value,
        productWarranty.value,
        brand.value,
        asset.value,
        brands,
        assets,
        models,
        mod.value,
        category.value,
        details.value,
        carType.value,
        descphoto.value,
        amount.value,
      );
      if (response != null && response.code == 200) {
        // Get.offNamedUntil(Routes.MAIN_PAGE, (route) => false);
        Get.offNamedUntil(Routes.MAIN_PAGE, (route) => false);
        addProductLoading.value = false;
      } else {
        errorDialog(content: response.error.toString());
      }
      addProductLoading.value = false;
    } on Exception catch (e) {
      // errorDialog(content: response.error.toString());
      // errorDialog(content: 'حدث خطأ\nمن فضلك اعد المحاولة مرة اخرى');
      throw e;
    }
  }

//7yF2DkwTDIJ0Mxv4PfJpQ9UqaeGQq5batsVWkZkMQnVgAtyqncQKAVKbJ3wZ

  getProductDetails(id) async {
    try {
      productDetailsLoading.value = true;
      ProductDetailsModel response = await client.getProductDetails(id);
      if (response != null && response.code == 200) {
        productDetailsDatum.addAll(response.data);
      } else {
        // errorDialog(content: response.toString());
      }
      productDetailsLoading.value = false;
    } on Exception catch (e) {
      throw e;
    }
  }
}

class CustomException implements Exception {
  String cause;
  CustomException(this.cause);
}
