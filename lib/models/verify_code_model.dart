class VerifyCodeModel {
  String phone;

  int code;

  VerifyCodeModel({this.code, this.phone});

  factory VerifyCodeModel.fromJson(Map<String, dynamic> json) =>
      VerifyCodeModel(
        phone: json['phone'],
        code: json['phone_verify'],
      );

  Map<String, dynamic> toJson() => {
        'phone': phone,
        'phone_verify': code,
      };
}

class VerifyCodeResponseModel {
  VerifyCodeResponseModel({
    this.maincode,
    this.code,
    this.token,
    this.error,
    this.data,
  });

  int maincode;
  int code;
  String token;
  dynamic error;
  Data data;

  factory VerifyCodeResponseModel.fromJson(Map<String, dynamic> json) =>
      VerifyCodeResponseModel(
        maincode: json["Maincode"],
        code: json["code"],
        token: json["token"],
        error: json["error"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "Maincode": maincode,
        "code": code,
        "token": token,
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
  dynamic photo;
  String city;
  dynamic country;
  String phone;
  int isVendor;
  dynamic lat;
  dynamic lon;

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
