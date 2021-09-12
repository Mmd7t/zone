import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:top_zone/models/aboutus_model.dart';
import 'package:top_zone/models/add_product_response_model.dart';
import 'package:top_zone/models/auth_model.dart';
import 'package:top_zone/models/brands_model.dart';
import 'package:top_zone/models/categories_model.dart';
import 'package:top_zone/models/assets_model.dart';
import 'package:top_zone/models/product_details_model.dart';
import 'package:top_zone/models/vendor_edit_profile.dart';
import 'package:top_zone/models/vendor_products_model.dart';
import 'package:top_zone/models/verify_code_model.dart';
part 'retrofit.g.dart';

@RestApi(baseUrl: 'https://zone.ibits.digital/api')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  /*--------------------------------------------------------------------------*/
  /*--------------------------------  Login  ---------------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("/login")
  Future<LoginResponseModel> postLogin(@Body() Map<String, dynamic> data);

  /*--------------------------------------------------------------------------*/
  /*------------------------------  Register  --------------------------------*/
  /*--------------------------------------------------------------------------*/
  @MultiPart()
  @POST("/venderrigste")
  Future<RegisterResponseModel> postRegister(
    @Part(name: 'file') File file,
    @Part(name: 'name') String name,
    @Part(name: 'email') String email,
    @Part(name: 'phone') String phone,
    @Part(name: 'password') String password,
    @Part(name: 'len') double len,
    @Part(name: 'alt') double alt,
  );

  /*--------------------------------------------------------------------------*/
  /*-----------------------------  Verify Code  ------------------------------*/
  /*--------------------------------------------------------------------------*/
  @POST("/verify")
  Future<VerifyCodeResponseModel> postVerifyCode(
      @Body() Map<String, dynamic> data);

  /*--------------------------------------------------------------------------*/
  /*-----------------------------  Categories  -------------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("/categories")
  Future<CategoriesModel> getCategories();

  /*--------------------------------------------------------------------------*/
  /*-------------------------------  Brands  ---------------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("/brands")
  Future<List<BrandsModel>> getBrands();

  /*--------------------------------------------------------------------------*/
  /*-------------------------------  Assets  ---------------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("/brand/{brand_id}/assets")
  Future<AssetsModel> getAssets(@Path('brand_id') int brandId);

  /*--------------------------------------------------------------------------*/
  /*--------------------------  Vendor Products  -----------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("/vendors/{id}/products")
  Future<VendorProductsModel> getVendorProducts(@Path('id') int id);

  /*--------------------------------------------------------------------------*/
  /*--------------------------  Product Details  -----------------------------*/
  /*--------------------------------------------------------------------------*/
  @GET("/product/{product_id}")
  Future<ProductDetailsModel> getProductDetails(
      @Path('product_id') int productId);

  /*--------------------------------------------------------------------------*/
  /*------------------------------  Register  --------------------------------*/
  /*--------------------------------------------------------------------------*/
  @MultiPart()
  @POST("/add_product")
  Future<AddProductResponseModel> addProduct(
    @Part(name: 'user_id') int userId,
    @Part(name: 'api_token') String apiToken,
    @Part(name: 'name') String name,
    @Part(name: 'photo') File photo,
    @Part(name: 'images') List<File> images,
    @Part(name: 'price') double price,
    @Part(name: 'product_number') int productNumber,
    @Part(name: 'product_condition') int productCondition,
    @Part(name: 'product_warranty') int productWarranty,
    @Part(name: 'brand_id') int brandId,
    @Part(name: 'asset_id') int assetId,
    @Part(name: 'brands') List<int> brands,
    @Part(name: 'assets') List<int> assets,
    @Part(name: 'models') List<int> models,
    @Part(name: 'mod') int mod,
    @Part(name: 'category_id') int categoryId,
    @Part(name: 'details') String details,
    @Part(name: 'car_type') int carType,
    @Part(name: 'discretion_photo') File photoDiscretion,
    @Part(name: 'stock') int qty,
  );
  /*--------------------------------------------------------------------------*/
  /*------------------------------  About Us  --------------------------------*/
  /*--------------------------------------------------------------------------*/

  @GET("/about_us")
  Future<AboutUsModel> getAboutUs();
  @GET("/warranty_policy")
  Future<AboutUsModel> getWarrantyPolicy();

  /*--------------------------------------------------------------------------*/
  /*------------------------------  Register  --------------------------------*/
  /*--------------------------------------------------------------------------*/
  @MultiPart()
  @POST("/vendor_editprofile")
  Future<VendorEditProfileResponseModel> vendorEditProfile(
    @Part(name: 'user_id') int userId,
    @Part(name: 'api_token') String apiToken,
    @Part(name: 'name') String name,
    @Part(name: 'email') String email,
    @Part(name: 'owner_name') String ownerName,
    @Part(name: 'image') File image,
    @Part(name: 'phone') String phone,
    @Part(name: 'lat') double lat,
    @Part(name: 'long') double long,
  );
}

//      _dio.interceptors.add(PrettyDioLogger(requestBody: true , requestHeader: true));
