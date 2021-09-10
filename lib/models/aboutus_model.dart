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
  List<Datum> data;

  factory AboutUsModel.fromJson(Map<String, dynamic> json) => AboutUsModel(
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
    this.description,
  });

  int id;
  String description;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
      };
}
