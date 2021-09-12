import 'dart:io';

class VendorEditProfile {
  int userId;
  String token;
  String name;
  File image;
  String email;
  double lat;
  double long;
  String phone;
  String ownerName;

  VendorEditProfile({
    this.email,
    this.image,
    this.lat,
    this.long,
    this.name,
    this.ownerName,
    this.phone,
    this.token,
    this.userId,
  });

  factory VendorEditProfile.fromJson(Map<String, dynamic> json) =>
      VendorEditProfile(
        userId: json['user_id'],
        email: json['email'],
        image: json['image'],
        lat: json['lat'],
        long: json['long'],
        name: json['name'],
        ownerName: json['owner_name'],
        phone: json['phone'],
        token: json['api_token'],
      );

  toMap() => {
        ['user_id']: userId,
        ['api_token']: token,
        ['name']: name,
        ['email']: email,
        ['image']: image,
        ['owner_name']: ownerName,
        ['lat']: lat,
        ['long']: long,
        ['phone']: phone,
      };
}

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
  int lon;

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
