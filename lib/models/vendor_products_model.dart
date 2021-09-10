class VendorProductsModel {
  VendorProductsModel({
    this.status,
    this.statusCode,
    this.error,
    this.data,
  });

  String status;
  String statusCode;
  dynamic error;
  List<ProductsDatum> data;

  factory VendorProductsModel.fromJson(Map<String, dynamic> json) =>
      VendorProductsModel(
        status: json["status"],
        statusCode: json["statusCode"],
        error: json["error"],
        data: (json["data"] == null)
            ? null
            : List<ProductsDatum>.from(
                json["data"].map((x) => ProductsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "statusCode": statusCode,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ProductsDatum {
  ProductsDatum({
    this.id,
    this.name,
    this.slug,
    this.photo,
    this.thumbnail,
    this.price,
    this.details,
    this.policy,
    this.productCondition,
    this.productNumber,
    this.carType,
    this.model,
    this.models,
    this.warrantyPeriod,
    this.galleries,
    this.user,
    this.brand,
    this.asset,
    this.category,
  });

  int id;
  String name;
  dynamic slug;
  String photo;
  dynamic thumbnail;
  int price;
  String details;
  String policy;
  int productCondition;
  String productNumber;
  dynamic carType;
  dynamic model;
  dynamic models;
  String warrantyPeriod;
  List<dynamic> galleries;
  User user;
  Asset brand;
  Asset asset;
  Category category;

  factory ProductsDatum.fromJson(Map<String, dynamic> json) => ProductsDatum(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        photo: json["photo"],
        thumbnail: json["thumbnail"],
        price: json["price"],
        details: json["details"] == null ? null : json["details"],
        policy: json["policy"],
        productCondition: json["product_condition"],
        productNumber: json["product_number"],
        carType: json["car_type"],
        model: json["model"],
        models: json["models"] == null ? null : json["models"],
        warrantyPeriod: json["warranty_period"],
        galleries: (json["galleries"] == null)
            ? null
            : List<dynamic>.from(json["galleries"].map((x) => x)),
        user: User.fromJson(json["user"]),
        brand: Asset.fromJson(json["brand"]),
        asset: Asset.fromJson(json["asset"]),
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "photo": photo,
        "thumbnail": thumbnail,
        "price": price,
        "details": details == null ? null : details,
        "policy": policy,
        "product_condition": productCondition,
        "product_number": productNumber,
        "car_type": carType,
        "model": model,
        "models": models == null ? null : models,
        "warranty_period": warrantyPeriod,
        "galleries": List<dynamic>.from(galleries.map((x) => x)),
        "user": user.toJson(),
        "brand": brand.toJson(),
        "asset": asset.toJson(),
        "category": category.toJson(),
      };
}

class Asset {
  Asset({
    this.id,
    this.name,
    this.slug,
    this.status,
    this.about,
    this.logo,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.categoryId,
    this.brandId,
  });

  int id;
  String name;
  String slug;
  int status;
  String about;
  String logo;
  int userId;
  DateTime createdAt;
  DateTime updatedAt;
  int categoryId;
  int brandId;

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
        id: json["id"],
        name: json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        status: json["status"],
        about: json["about"] == null ? null : json["about"],
        logo: json["logo"] == null ? null : json["logo"],
        userId: json["user_id"] == null ? null : json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        categoryId: json["category_id"] == null ? null : json["category_id"],
        brandId: json["brand_id"] == null ? null : json["brand_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug == null ? null : slug,
        "status": status,
        "about": about == null ? null : about,
        "logo": logo == null ? null : logo,
        "user_id": userId == null ? null : userId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "category_id": categoryId == null ? null : categoryId,
        "brand_id": brandId == null ? null : brandId,
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
    this.status,
    this.photo,
    this.isFeatured,
    this.image,
    this.productCount,
    this.userId,
  });

  int id;
  String name;
  String slug;
  int status;
  String photo;
  int isFeatured;
  String image;
  int productCount;
  int userId;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] ?? null,
        name: json["name"] ?? null,
        slug: json["slug"] ?? null,
        status: json["status"] ?? null,
        photo: json["photo"] ?? null,
        isFeatured: json["is_featured"] ?? null,
        image: json["image"] ?? null,
        productCount: json["product_count"] ?? null,
        userId: json["user_id"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "status": status,
        "photo": photo,
        "is_featured": isFeatured,
        "image": image,
        "product_count": productCount,
        "user_id": userId,
      };
}

class User {
  User({
    this.name,
    this.photo,
    this.city,
    this.country,
    this.phone,
    this.isVendor,
    this.isWholesaler,
    this.lat,
    this.lon,
  });

  String name;
  String photo;
  String city;
  String country;
  String phone;
  int isVendor;
  String isWholesaler;
  String lat;
  String lon;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        photo: json["photo"],
        city: json["city"],
        country: json["country"],
        phone: json["phone"],
        isVendor: json["is_vendor"],
        isWholesaler: json["is_wholesaler"],
        lat: json["lat"],
        lon: json["lon"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "photo": photo,
        "city": city,
        "country": country,
        "phone": phone,
        "is_vendor": isVendor,
        "is_wholesaler": isWholesaler,
        "lat": lat,
        "lon": lon,
      };
}
