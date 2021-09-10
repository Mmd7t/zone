class AboutUsModel {
  AboutUsModel({
    this.mainCode,
    this.code,
    this.error,
    this.data,
  });

  int mainCode;
  int code;
  dynamic error;
  List<AboutUsDatum> data;

  factory AboutUsModel.fromJson(Map<String, dynamic> json) => AboutUsModel(
        mainCode: json["mainCode"],
        code: json["code"],
        error: json["error"],
        data: List<AboutUsDatum>.from(
            json["data"].map((x) => AboutUsDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mainCode": mainCode,
        "code": code,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class AboutUsDatum {
  AboutUsDatum({
    this.id,
    this.description,
  });

  int id;
  String description;

  factory AboutUsDatum.fromJson(Map<String, dynamic> json) => AboutUsDatum(
        id: json["id"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
      };
}
