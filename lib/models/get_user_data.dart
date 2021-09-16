class GetUserDataModel {
  GetUserDataModel({
    this.maincode,
    this.code,
    this.error,
    this.data,
  });

  int maincode;
  int code;
  dynamic error;
  Data data;

  factory GetUserDataModel.fromJson(Map<String, dynamic> json) =>
      GetUserDataModel(
        maincode: json["maincode"],
        code: json["code"],
        error: json["error"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "maincode": maincode,
        "code": code,
        "error": error,
        "data": data.toJson(),
      };
}

class Data {
  Data({
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
  String photo;
  dynamic city;
  dynamic country;
  String phone;
  int isVendor;
  dynamic lat;
  int lon;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
