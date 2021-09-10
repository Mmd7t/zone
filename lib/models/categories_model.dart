class CategoriesModel {
  CategoriesModel({
    this.status,
    this.statusCode,
    this.error,
    this.data,
  });

  String status;
  String statusCode;
  dynamic error;
  List<CategoriesDatum> data;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        status: json["status"],
        statusCode: json["statusCode"],
        error: json["error"],
        data: List<CategoriesDatum>.from(
            json["data"].map((x) => CategoriesDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "statusCode": statusCode,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class CategoriesDatum {
  CategoriesDatum({
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

  factory CategoriesDatum.fromJson(Map<String, dynamic> json) =>
      CategoriesDatum(
        id: json["id"],
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
