class AddProductResponseModel {
  AddProductResponseModel({
    this.maincode,
    this.code,
    this.error,
    this.data,
  });

  int maincode;
  int code;
  dynamic error;
  List<Datum> data;

  factory AddProductResponseModel.fromJson(Map<String, dynamic> json) =>
      AddProductResponseModel(
        maincode: json["maincode"],
        code: json["code"],
        error: json["error"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "maincode": maincode,
        "code": code,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.slug,
    this.photo,
    this.thumbnail,
    this.file,
    this.price,
    this.details,
    this.policy,
    this.productCondition,
    this.metaDescription,
    this.review,
    this.note,
    this.productNumber,
    this.carType,
    this.model,
    this.models,
    this.warrantyPeriod,
    this.galleries,
    this.user,
    this.asset,
    this.category,
    this.brand,
    this.ratings,
  });

  int id;
  String name;
  dynamic slug;
  String photo;
  dynamic thumbnail;
  dynamic file;
  int price;
  String details;
  String policy;
  int productCondition;
  dynamic metaDescription;
  int review;
  dynamic note;
  String productNumber;
  String carType;
  dynamic model;
  int models;
  String warrantyPeriod;
  List<dynamic> galleries;
  User user;
  Asset asset;
  Category category;
  Asset brand;
  List<dynamic> ratings;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        photo: json["photo"],
        thumbnail: json["thumbnail"],
        file: json["file"],
        price: json["price"],
        details: json["details"],
        policy: json["policy"],
        productCondition: json["product_condition"],
        metaDescription: json["meta_description"],
        review: json["review"],
        note: json["note"],
        productNumber: json["product_number"],
        carType: json["car_type"],
        model: json["model"],
        models: json["models"],
        warrantyPeriod: json["warranty_period"],
        galleries: List<dynamic>.from(json["galleries"].map((x) => x)),
        user: User.fromJson(json["user"]),
        asset: Asset.fromJson(json["asset"]),
        category: (json["category"] == null)
            ? null
            : Category.fromJson(json["category"]),
        brand: Asset.fromJson(json["brand"]),
        ratings: List<dynamic>.from(json["ratings"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "photo": photo,
        "thumbnail": thumbnail,
        "file": file,
        "price": price,
        "details": details,
        "policy": policy,
        "product_condition": productCondition,
        "meta_description": metaDescription,
        "review": review,
        "note": note,
        "product_number": productNumber,
        "car_type": carType,
        "model": model,
        "models": models,
        "warranty_period": warrantyPeriod,
        "galleries": List<dynamic>.from(galleries.map((x) => x)),
        "user": user.toJson(),
        "asset": asset.toJson(),
        "category": category.toJson(),
        "brand": brand.toJson(),
        "ratings": List<dynamic>.from(ratings.map((x) => x)),
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
        slug: json["slug"],
        status: json["status"],
        about: json["about"],
        logo: json["logo"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        categoryId: json["category_id"],
        brandId: json["brand_id"] == null ? null : json["brand_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "status": status,
        "about": about,
        "logo": logo,
        "user_id": userId,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "category_id": categoryId,
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
        name: json["name"],
        slug: json["slug"],
        status: json["status"],
        photo: json["photo"],
        isFeatured: json["is_featured"],
        image: json["image"],
        productCount: json["product_count"],
        userId: json["user_id"],
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
    this.id,
    this.name,
    this.photo,
    this.city,
    this.country,
    this.phone,
    this.isVendor,
    this.lat,
    this.lon,
  });

  int id;
  String name;
  dynamic photo;
  String city;
  dynamic country;
  String phone;
  int isVendor;
  dynamic lat;
  dynamic lon;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        photo: json["photo"],
        city: json["city"],
        country: json["country"],
        phone: json["phone"],
        isVendor: json["is_vendor"],
        lat: json["lat"],
        lon: json["lon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "photo": photo,
        "city": city,
        "country": country,
        "phone": phone,
        "is_vendor": isVendor,
        "lat": lat,
        "lon": lon,
      };
}
