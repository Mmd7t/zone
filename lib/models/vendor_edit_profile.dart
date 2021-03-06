class VendorEditProfileResponseModel {
  VendorEditProfileResponseModel({
    this.maincode,
    this.code,
    this.error,
    this.data,
  });

  int maincode;
  int code;
  dynamic error;
  Data data;

  factory VendorEditProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      VendorEditProfileResponseModel(
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
    this.email,
    this.shopName,
    this.ownerName,
    this.isVendor,
    this.apiToken,
    this.lat,
    this.lon,
  });

  int id;
  String name;
  String photo;
  dynamic city;
  dynamic country;
  String phone;
  String email;
  dynamic shopName;
  dynamic ownerName;
  int isVendor;
  String apiToken;
  dynamic lat;
  double lon;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        photo: json["photo"],
        city: json["city"],
        country: json["country"],
        phone: json["phone"],
        email: json["email"],
        shopName: json["shop_name"],
        ownerName: json["owner_name"],
        isVendor: json["is_vendor"],
        apiToken: json["api_token"],
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
        "email": email,
        "shop_name": shopName,
        "owner_name": ownerName,
        "is_vendor": isVendor,
        "api_token": apiToken,
        "lat": lat,
        "lon": lon,
      };
}
