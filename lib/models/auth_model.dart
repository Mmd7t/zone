import 'dart:io';

class RegisterModel {
  String name;
  File file;
  String email;
  int cityId;
  String password;
  double alt;
  double len;
  String phone;
  String photo;

  RegisterModel({
    this.alt,
    this.cityId,
    this.email,
    this.file,
    this.len,
    this.name,
    this.password,
    this.phone,
    this.photo,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        name: json['name'],
        file: json['file'],
        email: json['email'],
        cityId: json['city_id'],
        password: json['password'],
        alt: json['alt'],
        len: json['len'],
        phone: json['phone'],
        photo: json['photo'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'file': file,
        'email': email,
        'city_id': cityId,
        'password': password,
        'alt': alt,
        'len': len,
        'phone': phone,
        'photo': photo,
      };
}

class RegisterResponseModel {
  RegisterResponseModel({
    this.maincode,
    this.code,
    this.error,
    this.data,
    this.phoneVerify,
  });

  int maincode;
  int code;
  dynamic error;
  String data;
  int phoneVerify;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        maincode: json["maincode"],
        code: json["code"],
        error: json["error"],
        data: json["data"],
        phoneVerify: json["phone_verify"],
      );

  Map<String, dynamic> toJson() => {
        "maincode": maincode,
        "code": code,
        "error": error,
        "data": data,
        "phone_verify": phoneVerify,
      };
}

class LoginModel {
  String password;
  String phone;

  LoginModel({
    this.password,
    this.phone,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        password: json['password'],
        phone: json['phone_number'],
      );

  Map<String, dynamic> toJson() => {
        'password': password,
        'phone_number': phone,
      };
}

class LoginResponseModel {
  LoginResponseModel({
    this.maincode,
    this.code,
    this.data,
    this.error,
  });

  int maincode;
  int code;
  Data data;
  dynamic error;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        maincode: json["maincode"],
        code: json["code"],
        data: Data.fromJson(json["data"]),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "maincode": maincode,
        "code": code,
        "data": data.toJson(),
        "error": error,
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
  dynamic photo;
  String city;
  dynamic country;
  String phone;
  String email;
  dynamic shopName;
  dynamic ownerName;
  int isVendor;
  String apiToken;
  dynamic lat;
  dynamic lon;

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
