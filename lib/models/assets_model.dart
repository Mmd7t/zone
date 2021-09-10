class AssetsModel {
  AssetsModel({
    this.mainCode,
    this.code,
    this.error,
    this.data,
  });

  int mainCode;
  int code;
  dynamic error;
  List<Datum> data;

  factory AssetsModel.fromJson(Map<String, dynamic> json) => AssetsModel(
        mainCode: json["mainCode"],
        code: json["code"],
        error: json["error"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mainCode": mainCode,
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
  dynamic createdAt;
  dynamic updatedAt;
  int categoryId;
  int brandId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        status: json["status"],
        about: json["about"] == null ? null : json["about"],
        logo: json["logo"] == null ? null : json["logo"],
        userId: json["user_id"] == null ? null : json["user_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        categoryId: json["category_id"] == null ? null : json["category_id"],
        brandId: json["brand_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug == null ? null : slug,
        "status": status,
        "about": about == null ? null : about,
        "logo": logo == null ? null : logo,
        "user_id": userId == null ? null : userId,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "category_id": categoryId == null ? null : categoryId,
        "brand_id": brandId,
      };
}
