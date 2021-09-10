class BrandsModel {
  BrandsModel({
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

  factory BrandsModel.fromJson(Map<String, dynamic> json) => BrandsModel(
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
      };
}
