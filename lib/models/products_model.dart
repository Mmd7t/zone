import 'dart:io';

class ProductsModel {
  int userId;
  String apiToken;
  String name;
  File photo;
  File image;
  double price;
  int productNumber;
  int productCondition;
  int productWarranty;
  // int productDiscretion;
  // File discretionPhoto;
  int brandId;
  int assetId;
  // int mod;
  // int brands;
  // int assets;
  // int models;
  int categoryId;
  String details;
  // String carType;

  ProductsModel({
    this.apiToken,
    this.assetId,
    // this.assets,
    this.brandId,
    // this.brands,
    // this.carType,
    this.categoryId,
    this.details,
    // this.discretionPhoto,
    this.image,
    // this.mod,
    // this.models,
    this.name,
    this.photo,
    this.price,
    this.productCondition,
    // this.productDiscretion,
    this.productNumber,
    this.productWarranty,
    this.userId,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        userId: json['user_id'],
        apiToken: json['api_token'],
        assetId: json['asset_id'],
        // assets: json['assets[]'],
        brandId: json['brand_id'],
        // brands: json['brands[]'],
        // carType: json['car_type'],
        categoryId: json['category_id'],
        details: json['details'],
        // discretionPhoto: json['discretion_photo'],
        image: json['images[0]'],
        // mod: json['mod'],
        // models: json['models[]'],
        name: json['name'],
        photo: json['photo'],
        price: json['price'],
        productCondition: json['product_condition'],
        // productDiscretion: json['product_discretion'],
        productNumber: json['product_number'],
        productWarranty: json['product_warranty'],
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'api_token': apiToken,
        'asset_id': assetId,
        // 'assets[]': assets,
        'brand_id': brandId,
        // 'brands[]': brands,
        // 'car_type': carType,
        'category_id': categoryId,
        'details': details,
        // 'discretion_photo': discretionPhoto,
        'images[0]': image,
        // 'mod': mod,
        // 'models[]': models,
        'name': name,
        'photo': photo,
        'price': price,
        'product_condition': productCondition,
        // 'product_discretion': productDiscretion,
        'product_number': productNumber,
        'product_warranty': productWarranty,
      };
}
