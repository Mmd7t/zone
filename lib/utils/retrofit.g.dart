// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrofit.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://zone.ibits.digital/api';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<LoginResponseModel> postLogin(data) async {
    ArgumentError.checkNotNull(data, 'data');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = LoginResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<RegisterResponseModel> postRegister(
      file, name, email, phone, password, len, alt) async {
    ArgumentError.checkNotNull(file, 'file');
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(email, 'email');
    ArgumentError.checkNotNull(phone, 'phone');
    ArgumentError.checkNotNull(password, 'password');
    ArgumentError.checkNotNull(len, 'len');
    ArgumentError.checkNotNull(alt, 'alt');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.files.add(MapEntry(
        'file',
        MultipartFile.fromFileSync(file.path,
            filename: file.path.split(Platform.pathSeparator).last)));
    if (name != null) {
      _data.fields.add(MapEntry('name', name));
    }
    if (email != null) {
      _data.fields.add(MapEntry('email', email));
    }
    if (phone != null) {
      _data.fields.add(MapEntry('phone', phone));
    }
    if (password != null) {
      _data.fields.add(MapEntry('password', password));
    }
    if (len != null) {
      _data.fields.add(MapEntry('len', len.toString()));
    }
    if (alt != null) {
      _data.fields.add(MapEntry('alt', alt.toString()));
    }
    final _result = await _dio.request<Map<String, dynamic>>('/venderrigste',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = RegisterResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<VerifyCodeResponseModel> postVerifyCode(data) async {
    ArgumentError.checkNotNull(data, 'data');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/verify',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = VerifyCodeResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<CategoriesModel> getCategories() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/categories',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = CategoriesModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<List<BrandsModel>> getBrands() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<List<dynamic>>('/brands',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => BrandsModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<AssetsModel> getAssets(brandId) async {
    ArgumentError.checkNotNull(brandId, 'brandId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/brand/$brandId/assets',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AssetsModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<VendorProductsModel> getVendorProducts(id) async {
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/vendors/$id/products',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = VendorProductsModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<ProductDetailsModel> getProductDetails(productId) async {
    ArgumentError.checkNotNull(productId, 'productId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/product/$productId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ProductDetailsModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<AddProductResponseModel> addProduct(
      userId,
      apiToken,
      name,
      photo,
      images,
      price,
      productNumber,
      productCondition,
      productWarranty,
      brandId,
      assetId,
      brands,
      assets,
      models,
      mod,
      categoryId,
      details,
      carType,
      photoDiscretion,
      qty) async {
    ArgumentError.checkNotNull(userId, 'userId');
    ArgumentError.checkNotNull(apiToken, 'apiToken');
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(photo, 'photo');
    ArgumentError.checkNotNull(images, 'images');
    ArgumentError.checkNotNull(price, 'price');
    ArgumentError.checkNotNull(productNumber, 'productNumber');
    ArgumentError.checkNotNull(productCondition, 'productCondition');
    ArgumentError.checkNotNull(productWarranty, 'productWarranty');
    ArgumentError.checkNotNull(brandId, 'brandId');
    ArgumentError.checkNotNull(assetId, 'assetId');
    ArgumentError.checkNotNull(brands, 'brands');
    ArgumentError.checkNotNull(assets, 'assets');
    ArgumentError.checkNotNull(models, 'models');
    ArgumentError.checkNotNull(mod, 'mod');
    ArgumentError.checkNotNull(categoryId, 'categoryId');
    ArgumentError.checkNotNull(details, 'details');
    ArgumentError.checkNotNull(carType, 'carType');
    ArgumentError.checkNotNull(photoDiscretion, 'photoDiscretion');
    ArgumentError.checkNotNull(qty, 'qty');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    if (userId != null) {
      _data.fields.add(MapEntry('user_id', userId.toString()));
    }
    if (apiToken != null) {
      _data.fields.add(MapEntry('api_token', apiToken));
    }
    if (name != null) {
      _data.fields.add(MapEntry('name', name));
    }
    _data.files.add(MapEntry(
        'photo',
        MultipartFile.fromFileSync(photo.path,
            filename: photo.path.split(Platform.pathSeparator).last)));
    _data.files.addAll(images?.map((i) => MapEntry(
        'images',
        MultipartFile.fromFileSync(
          i.path,
          filename: i.path.split(Platform.pathSeparator).last,
        ))));
    if (price != null) {
      _data.fields.add(MapEntry('price', price.toString()));
    }
    if (productNumber != null) {
      _data.fields.add(MapEntry('product_number', productNumber.toString()));
    }
    if (productCondition != null) {
      _data.fields
          .add(MapEntry('product_condition', productCondition.toString()));
    }
    if (productWarranty != null) {
      _data.fields
          .add(MapEntry('product_warranty', productWarranty.toString()));
    }
    if (brandId != null) {
      _data.fields.add(MapEntry('brand_id', brandId.toString()));
    }
    if (assetId != null) {
      _data.fields.add(MapEntry('asset_id', assetId.toString()));
    }
    _data.files.add(MapEntry(
        'brands',
        MultipartFile.fromBytes(
          brands,
          filename: null,
        )));
    _data.files.add(MapEntry(
        'assets',
        MultipartFile.fromBytes(
          assets,
          filename: null,
        )));
    _data.files.add(MapEntry(
        'models',
        MultipartFile.fromBytes(
          models,
          filename: null,
        )));
    if (mod != null) {
      _data.fields.add(MapEntry('mod', mod.toString()));
    }
    if (categoryId != null) {
      _data.fields.add(MapEntry('category_id', categoryId.toString()));
    }
    if (details != null) {
      _data.fields.add(MapEntry('details', details));
    }
    if (carType != null) {
      _data.fields.add(MapEntry('car_type', carType.toString()));
    }
    _data.files.add(MapEntry(
        'discretion_photo',
        MultipartFile.fromFileSync(photoDiscretion.path,
            filename:
                photoDiscretion.path.split(Platform.pathSeparator).last)));
    if (qty != null) {
      _data.fields.add(MapEntry('stock', qty.toString()));
    }
    final _result = await _dio.request<Map<String, dynamic>>('/add_product',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AddProductResponseModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<AboutUsModel> getAboutUs() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/about_us',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AboutUsModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<AboutUsModel> getWarrantyPolicy() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('/warranty_policy',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = AboutUsModel.fromJson(_result.data);
    return value;
  }

  @override
  Future<VendorEditProfileResponseModel> vendorEditProfile(
      userId, apiToken, name, email, ownerName, image, phone, lat, long) async {
    ArgumentError.checkNotNull(userId, 'userId');
    ArgumentError.checkNotNull(apiToken, 'apiToken');
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(email, 'email');
    ArgumentError.checkNotNull(ownerName, 'ownerName');
    ArgumentError.checkNotNull(image, 'image');
    ArgumentError.checkNotNull(phone, 'phone');
    ArgumentError.checkNotNull(lat, 'lat');
    ArgumentError.checkNotNull(long, 'long');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    if (userId != null) {
      _data.fields.add(MapEntry('user_id', userId.toString()));
    }
    if (apiToken != null) {
      _data.fields.add(MapEntry('api_token', apiToken));
    }
    if (name != null) {
      _data.fields.add(MapEntry('name', name));
    }
    if (email != null) {
      _data.fields.add(MapEntry('email', email));
    }
    if (ownerName != null) {
      _data.fields.add(MapEntry('owner_name', ownerName));
    }
    _data.files.add(MapEntry(
        'image',
        MultipartFile.fromFileSync(image.path,
            filename: image.path.split(Platform.pathSeparator).last)));
    if (phone != null) {
      _data.fields.add(MapEntry('phone', phone));
    }
    if (lat != null) {
      _data.fields.add(MapEntry('lat', lat.toString()));
    }
    if (long != null) {
      _data.fields.add(MapEntry('long', long.toString()));
    }
    final _result = await _dio.request<Map<String, dynamic>>(
        '/vendor_editprofile',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = VendorEditProfileResponseModel.fromJson(_result.data);
    return value;
  }
}
